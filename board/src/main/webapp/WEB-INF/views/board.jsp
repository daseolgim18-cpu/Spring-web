<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${pageTitle}</title>
    <style>
        body { font-family: 'Malgun Gothic', Arial, sans-serif; margin: 40px; background-color: #ffffff; color: #000000; line-height: 1.4; margin: 0; 
                min-height: 100vh;           
                display: flex;               
                flex-direction: column;      
                justify-content: center;    
                align-items: center;         
                padding: 40px 0;            
                box-sizing: border-box;}
        h2 { border-bottom: 2px solid #000000; padding-bottom: 10px; }
        .write-section { margin: 20px 0; padding: 15px; border: 1px solid #000000; width: 650px; }
        .form-group { margin-bottom: 10px; }
        .form-group label { display: inline-block; width: 60px; font-weight: bold; }
        input[type="text"], textarea {padding: 6px; border: 1px solid #000000; font-size: 14px; box-sizing: border-box; }
        input[type="text"] {width: 550px; }
        textarea { width: 550px; height: 80px; vertical-align: top; }
        button { padding: 8px 20px; background-color: #198754; color: #ffffff; border: none; cursor: pointer; font-size: 14px; font-weight: bold; }
        button:hover { background-color: #146c43; }
        table { border-collapse: collapse; width: 700px; margin-top: 20px; }
        th, td { border: 1px solid #000000; padding: 10px; text-align: left; font-size: 14px;}
        th { background-color: #f2f2f2; font-weight: bold; text-align: center; }
        .text-center { text-align: center; }
        .btn-delete { padding: 4px 8px; background-color: #ff3333; color: #ffffff; font-size: 12px; border: none; cursor: pointer;}
        .btn-delete:hover { background-color: #cc0000; }
    </style>
</head>
<body>
    <h2>${pageTitle}</h2>
    <div class="write-section">
    <h3>새 게시글 작성</h3>
        <form action="/board/write" method="post">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" required placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="text" id="writer" name="writer" style="width: 200px;" required placeholder="작성자">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" required placeholder="내용을 입력하세요"></textarea>
            </div>
            <div style="text-align: right; width: 610px;">
                <button type="submit">게시글 등록</button>
            </div>
        </form>
    </div>

    <h3>등록된 게시글 목록</h3>
    <table>
        <thead>
            <tr>
                <th style="width: 10%;">번호</th>
                <th style="width: 45%;">제목 / 내용</th>
                <th style="width: 15%;">작성자</th>
                <th style="width: 15%;">작성일시</th> 
                <th style="width: 15%;">관리</th>   
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty boardList}">
                <tr>
                    <td colspan="5" class="text-center">등록된 게시글이 존재하지 않습니다.</td>
                </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="board" items="${boardList}">
                        <tr>
                            <td class="text-center">${board.bno}</td>
                            <td>
                                <strong><c:out value="${board.title}"/></strong>
                                <br>
                                <span style="color: #555555; font-size: 13px;"><c:out value="${board.content}"/></span>
                            </td>
                            <td class="text-center"><c:out value="${board.writer}"/></td>
                            <td class="text-center" style="font-size: 12px;">
                                ${board.regdate.toLocalDate()} ${board.regdate.toLocalTime().withNano(0)}
                            </td>
                            <td class="text-center">
                                <form action="/board/delete" method="post" style="margin:0;">
                                    <input type="hidden" name="bno" value="${board.bno}">
                                    <button type="submit" class="btn-delete" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</body>
</html>