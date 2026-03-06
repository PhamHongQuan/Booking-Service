package com.booking.service_booking.service;

import com.booking.service_booking.dto.request.LoginRequest;
import com.booking.service_booking.dto.request.RegisterRequest;
import com.booking.service_booking.dto.response.AuthResponse;

public interface AuthService {
    AuthResponse register(RegisterRequest request);
    AuthResponse login(LoginRequest request);
}
