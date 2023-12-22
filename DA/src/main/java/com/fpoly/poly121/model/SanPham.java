package com.fpoly.poly121.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "san_pham")

public class SanPham {
    @Id
    @GeneratedValue(strategy =GenerationType.IDENTITY )
    @Column(name = "id")
    private Long id;

    @NotBlank
    @Column(name = "ten_san_pham")
    private String tenSanPham;


}