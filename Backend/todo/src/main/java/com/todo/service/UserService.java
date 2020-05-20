package com.todo.service;

import java.util.Collections;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todo.model.User;
import com.todo.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public List<User> getAllUser() {
		List<User> user = userRepository.getAllUser();
		Collections.sort(user);
		return user;
	}

	public User getSingleUser(String email) {
		return userRepository.getSingleUser(email);
	}

	public String postUser(@Valid @NotNull User user) {
		return userRepository.postUser(user);
	}

	public String updateUser(User user) {
		return userRepository.updateUser(user);
	}

	public String deleteUser(User user) {
		return userRepository.deleteUser(user);
		
	}
	
}