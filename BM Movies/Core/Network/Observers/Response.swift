//
//  Response.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

enum APIResponse<T> {

    case onSuccess(T)
    case onFailure(APIError)
}
