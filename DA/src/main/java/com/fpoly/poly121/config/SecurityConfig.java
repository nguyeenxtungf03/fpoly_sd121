package com.fpoly.poly121.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf(csrf -> csrf.disable())
                .authorizeRequests(authorize -> authorize
                        .requestMatchers(new AntPathRequestMatcher("/admin/**"))
                        .hasAuthority("ROLE_ADMIN")
                        .requestMatchers(new AntPathRequestMatcher("/staff/**"))
                        .hasAuthority("ROLE_STAFF")
                        .requestMatchers(new AntPathRequestMatcher("/user/**"))
                        .authenticated()
                        .anyRequest()
                        .permitAll())
                .formLogin(login -> login
                        .loginPage("/auth/dang-nhap")
                        .loginProcessingUrl("/login")
                        .defaultSuccessUrl("/trang-chu"))
                .logout(logout -> logout
                        .logoutSuccessUrl("/trang-chu"))
                .httpBasic(Customizer.withDefaults());
        return httpSecurity.build();
    }
}
