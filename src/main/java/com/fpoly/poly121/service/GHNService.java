package com.fpoly.poly121.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fpoly.poly121.controller.GioHangChiTietController;
import com.fpoly.poly121.dto.request.GioHangChiTietDto;
import com.fpoly.poly121.dto.response.HuyenResponse;
import com.fpoly.poly121.dto.response.PhiVanChuyenResponse;
import com.fpoly.poly121.dto.response.TinhResponse;
import com.fpoly.poly121.dto.response.XaResponse;
import com.fpoly.poly121.utils.SecurityUtil;
import lombok.AllArgsConstructor;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Service
@AllArgsConstructor
public class GHNService {

    private final GioHangChiTietService gioHangChiTietService;

    public List<TinhResponse> getProvinces () {
        List<TinhResponse> provinces = new ArrayList<>();
        try {
            URL url = new URL("https://online-gateway.ghn.vn/shiip/public-api/master-data/province");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("token", "403ee2b3-9db4-11ee-af43-6ead57e9219a");
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = reader.readLine()) != null) {
                response.append(inputLine);
            }
            reader.close();
            ObjectMapper objectMapper = new ObjectMapper();
            Object jsonNode = objectMapper.readTree(response.toString());

            for (Object p : ((ObjectNode) jsonNode).get("data")) {
                if (((ObjectNode) p).get("Status").toString().equals("1")) provinces.add(new TinhResponse(((ObjectNode) p).get("ProvinceID").toString().replace("\"", ""),((ObjectNode) p).get("ProvinceName").toString().replace("\"", "")));
            }
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        provinces.sort(Comparator.comparing(TinhResponse::getTenTinh));
        return provinces;
    }

    public List<HuyenResponse> getDistricts (String idTinh) {
        List<HuyenResponse> districts = new ArrayList<>();
        try {
            URL url = new URL("https://online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=" + idTinh);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("token", "403ee2b3-9db4-11ee-af43-6ead57e9219a");
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = reader.readLine()) != null) {
                response.append(inputLine);
            }
            reader.close();
            ObjectMapper objectMapper = new ObjectMapper();
            Object jsonNode = objectMapper.readTree(response.toString());

            for (Object d : ((ObjectNode) jsonNode).get("data")) {
                if (((ObjectNode) d).get("Status").toString().equals("1")) districts.add(new HuyenResponse(((ObjectNode) d).get("DistrictID").toString().replace("\"", ""),((ObjectNode) d).get("DistrictName").toString().replace("\"", "")));
            }
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        districts.sort(Comparator.comparing(HuyenResponse::getTenHuyen));
        return districts;
    }

    public List<XaResponse> getWards (String idHuyen) {
        List<XaResponse> wards = new ArrayList<>();
        try {
            URL url = new URL("https://online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=" + idHuyen);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("token", "403ee2b3-9db4-11ee-af43-6ead57e9219a");
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = reader.readLine()) != null) {
                response.append(inputLine);
            }
            reader.close();
            ObjectMapper objectMapper = new ObjectMapper();
            Object jsonNode = objectMapper.readTree(response.toString());

            for (Object w : ((ObjectNode) jsonNode).get("data")) {
                if (((ObjectNode) w).get("Status").toString().equals("1")) wards.add(new XaResponse(((ObjectNode) w).get("WardCode").toString().replace("\"", ""), ((ObjectNode) w).get("WardName").toString().replace("\"", "")));
            }
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        wards.sort(Comparator.comparing(XaResponse::getTenXa));
        return wards;
    }

    public PhiVanChuyenResponse getTransportFee (String idHuyen, String maXa) {
        List<GioHangChiTietDto> listGhctDto = null;
        // lay tk khi dang nhap
        String tk = SecurityUtil.getUsernameLogin();
        if (tk.isEmpty()) { // tk khi ko dang nhap
            try {
                // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại
                InetAddress localhost = InetAddress.getLocalHost();
                // Lấy địa chỉ IP của máy tính
                String ipAddress = localhost.getHostAddress();
                // lay danh sach gio hang bang IP
                listGhctDto = gioHangChiTietService.getGioHangChiTiet(ipAddress);

                // check gio hang de trong
                if (listGhctDto.isEmpty()) {
                    return new PhiVanChuyenResponse().setTongPhi(0L);
                }

            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        } else { // tk khi dang nhap
            // Gọi service để lấy danh sách chi tiết giỏ hàng
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();

            // Lấy danh sách giỏ hàng chi tiết của người dùng
            listGhctDto = gioHangChiTietService.getGioHangChiTiet(username);

            // check gio hang de trong
            if (listGhctDto.isEmpty()) {
                return new PhiVanChuyenResponse().setTongPhi(0L);
            }
        }
        Long weight = 0L;
        Long length = 27L;
        Long width = 13L;
        Long height = 0L;
        Long insuranceValue = 0L;
        for (GioHangChiTietDto gioHangChiTietDto : listGhctDto) {
            weight += 200 * gioHangChiTietDto.getSoLuong();
            height += 4 * gioHangChiTietDto.getSoLuong();
            insuranceValue += gioHangChiTietDto.getSoLuong() * gioHangChiTietDto.getIdSanPhamChiTiet().getGiaBan();
        }
        PhiVanChuyenResponse phiVanChuyenResponse = new PhiVanChuyenResponse();
        phiVanChuyenResponse.setTongPhi(30000L);

        Long serviceId = 53322L;
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            String apiUrl = "https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services";
            String  toDistrictId = idHuyen;
            HttpPost httpPost = new HttpPost(apiUrl);

            String requestBody = "{\"shop_id\":4777358,\"from_district\":1542,\"to_district\":" + toDistrictId + "}";

            StringEntity stringEntity = new StringEntity(requestBody, ContentType.APPLICATION_JSON);
            httpPost.setEntity(stringEntity);
            httpPost.setHeader("token", "403ee2b3-9db4-11ee-af43-6ead57e9219a");

            try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    String result = EntityUtils.toString(entity);
                    ObjectMapper objectMapper = new ObjectMapper();
                    Object jsonNode = objectMapper.readTree(result);
                    Object listData = ((ObjectNode) jsonNode).get("data");
                    Object data = ((ArrayNode) listData).get(0);
                    serviceId = ((ObjectNode) data).get("service_id").asLong();
                    System.out.println(data);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            String apiUrl = "https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee";
            String toWardCode = maXa;
            String  toDistrictId = idHuyen;
            Long fromDistrictId = 1542L;
            HttpPost httpPost = new HttpPost(apiUrl);
            String itemsArray = "[{\"name\":\"TEST\",\"quantity\":1,\"height\":" + height + ",\"weight\":" + weight + ",\"length\":" + length + ",\"width\":" + width + "}]";

            String requestBody = "{\"service_id\":" + serviceId
                    + ",\"insurance_value\":" + insuranceValue
                    + ",\"coupon\":null,"
                    + "\"from_district_id\":" + fromDistrictId
                    + ",\"to_district_id\":" + toDistrictId
                    + ",\"to_ward_code\":\"" + toWardCode
                    + "\",\"height\":" + height
                    + ",\"length\":" + length
                    + ",\"weight\":" + weight
                    + ",\"width\":" + width
                    + ",\"items\":" + itemsArray
                    + "}";

            StringEntity stringEntity = new StringEntity(requestBody, ContentType.APPLICATION_JSON);
            httpPost.setEntity(stringEntity);
            httpPost.setHeader("token", "403ee2b3-9db4-11ee-af43-6ead57e9219a");

            try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    String result = EntityUtils.toString(entity);
                    ObjectMapper objectMapper = new ObjectMapper();
                    Object jsonNode = objectMapper.readTree(result);
                    Object data = ((ObjectNode) jsonNode).get("data");
                    Long total = ((ObjectNode) data).get("total").asLong();
                    phiVanChuyenResponse.setTongPhi(total);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return phiVanChuyenResponse;
    }

}
