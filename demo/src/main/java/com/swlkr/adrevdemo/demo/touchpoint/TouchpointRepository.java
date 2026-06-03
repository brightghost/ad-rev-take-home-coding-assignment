package com.swlkr.adrevdemo.demo.touchpoint;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TouchpointRepository extends JpaRepository<Touchpoint, String> {
    // Custom query methods if needed
}