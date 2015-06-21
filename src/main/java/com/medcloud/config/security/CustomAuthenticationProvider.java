package com.medcloud.config.security;

import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class CustomAuthenticationProvider extends DaoAuthenticationProvider{
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		System.out.println("Credential: " + authentication.getCredentials().toString());
		Authentication authenticationEfetuada = super.authenticate(authentication);

		return authenticationEfetuada;
	}

}
