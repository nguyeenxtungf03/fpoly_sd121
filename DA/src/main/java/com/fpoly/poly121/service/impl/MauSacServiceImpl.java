package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.model.MauSac;
import com.fpoly.poly121.repository.MauSacReponsitory;
import com.fpoly.poly121.service.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MauSacServiceImpl implements MauSacService {
    @Autowired
    private MauSacReponsitory mauSacRepository;


    @Override
    public Page<MauSac> getPage(Integer page) {
        Pageable pageable = PageRequest.of(page,5);
        return mauSacRepository.findAll(pageable);
    }

    @Override
    public void add(MauSac mauSac) {
        mauSacRepository.save(mauSac);

    }

    @Override
    public void update(MauSac mauSac) {
        mauSacRepository.save(mauSac);

    }

    @Override
    public List<MauSac> getAll() {
        return mauSacRepository.findAll();
    }

    @Override
    public void delete(Long id) {
        mauSacRepository.deleteById(id);

    }

    @Override
    public MauSac detail(Long id) {
        return mauSacRepository.getById(id);
    }

    @Override
    public List<MauSac> search( String tenMauSac) {
        return mauSacRepository.search(tenMauSac);
    }
}
