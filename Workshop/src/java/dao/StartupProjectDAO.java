/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.StartupProjectDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author FPTSHOP
 */
public class StartupProjectDAO implements ProjectDAO<StartupProjectDTO, String> {

    @Override
    public boolean create(StartupProjectDTO entity) {
        return false;
    }

    @Override
    public List<StartupProjectDTO> readAll() {
        return null;
    }

    @Override
    public StartupProjectDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(StartupProjectDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<StartupProjectDTO> search(String searchTerm) {
        return null;
    }

    public List<StartupProjectDTO> searchByName(String searchTerm) {
        String sql = "SELECT * FROM tblStartupProjects WHERE name LIKE ?";
        List<StartupProjectDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StartupProjectDTO project = new StartupProjectDTO(
                        rs.getInt("project_id"),
                        rs.getString("project_name"),
                        rs.getString("Description"),
                        rs.getString("Status"),
                        rs.getDate("estimated_launch"));
                list.add(project);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
