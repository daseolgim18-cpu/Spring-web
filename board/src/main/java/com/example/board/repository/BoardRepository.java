package com.example.board.repository;

import com.example.board.domain.BoardDTO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

@Repository
public class BoardRepository {
    
    private final JdbcTemplate jdbcTemplate;

    public BoardRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<BoardDTO> selectAll() {
        String sql = "SELECT bno, title, content, writer, regdate FROM board ORDER BY bno DESC";
        return jdbcTemplate.query(sql, new BoardRowMapper());
    }

    public void insert(BoardDTO board) {
        String sql = "INSERT INTO board (bno, title, content, writer) values(seq_board.nextval, ?, ?, ?)";
        jdbcTemplate.update(sql, board.getTitle(), board.getContent(), board.getWriter());
    }

    public void delete(int bno) {
        String sql = "DELETE FROM board WHERE bno = ?";
        jdbcTemplate.update(sql, bno);
    }

    private static class BoardRowMapper implements RowMapper<BoardDTO> {
        @Override
        public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
            BoardDTO dto = new BoardDTO();
            dto.setBno(rs.getInt("bno"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setWriter(rs.getString("writer"));
            dto.setRegdate(rs.getTimestamp("regdate").toLocalDateTime());
            return dto;

        }
    }
}
