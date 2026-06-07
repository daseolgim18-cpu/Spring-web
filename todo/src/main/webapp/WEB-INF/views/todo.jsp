<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${pageTitle}</title>
    <style>
        body { font-family: 'Malgun Gothic', Arial, sans-serif; margin: 40px; background-color: #ffffff; color: #000000;}
        h2 { border-bottom: 2px solid #000000; padding-bottom: 10px; }
        .input-box { margin: 20px 0; }
        input[type="text"] {padding: 8px; width: 250px; border: 1px solid #000000; font-size: 14px; }
        button { padding: 8px 15px; background-color: #000000; color: #ffffff; border: none; cursor: pointer; font-size: 14px; }
        button:hover { background-color: #333333; }
        table { border-collapse: collapse; width: 550px; margin-top: 15px; }
        th, td { border: 1px solid #000000; padding: 10px; text-align: left; font-size: 14px;}
        th { background-color: #f2f2f2; font-weight: bold; text-align: center; }
        .text-center { text-align: center; }
        .btn-delete { padding: 4px 8px; background-color: #0fc357; color: #ffffff; font-size: 12px;}
        .btn-delete:hover { background-color: #035824; }
    </style>
</head>
<body>
    <h2>${pageTitle}</h2>
    <div class="input-box">
        <form action="/todo/add" method="post">
            <input type="text" name="task" placeholder="새로운 할 일을 입력하세요" required>
            <button type="submit">추가</button>
        </form>
    </div>

    <h3>현재 진행할 과제 목록</h3>
    <table>
        <thead>
            <tr>
                <th style="width: 15%;">번호</th>
                <th style="width: 65%;">할 일 내용</th>
                <th style="width: 20%;">관리</th>  
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${todos}" varStatus="loop">
                <tr>
                    <td class="text-center">${loop.count}</td>
                    <td> <c:out value="${item}"/></td>
                    <td class="text-center">
                        <form action="/todo/delete" method="post" style="margin:0;">
                            <input type="hidden" name="index" value="${loop.index}">
                            <button type="submit" class="btn-delete">삭제</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>