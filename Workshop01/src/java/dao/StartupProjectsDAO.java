/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.StartupProjectsDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author FPTSHOP
 */
public class StartupProjectsDAO implements ProjectDAO<StartupProjectsDTO, String> {

    @Override
    public boolean create(StartupProjectsDTO project) {
        boolean check = false;
        String sql = "INSERT INTO tblStartupProjects (project_name, Description, Status, estimated_launch) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, project.getProjectName());
            ps.setString(2, project.getDescription());
            ps.setString(3, project.getStatus());
            ps.setDate(4, (Date) project.getEstimatedLaunch());

            check = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StartupProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
            Logger.getLogger(StartupProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    @Override
    public List<StartupProjectsDTO> readAll() {
        return null;
    }

    @Override
    public StartupProjectsDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(StartupProjectsDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<StartupProjectsDTO> search(String searchTerm) {
        return null;
    }

    public List<StartupProjectsDTO> searchByName(String searchTerm) {
        String sql = "SELECT * FROM [tblStartupProjects]" + " WHERE [project_name] LIKE ?";
        List<StartupProjectsDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StartupProjectsDTO project = new StartupProjectsDTO(
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

    public List<StartupProjectsDTO> getAllProjects() throws ClassNotFoundException {
        List<StartupProjectsDTO> projectList = new ArrayList<>();
        String sql = "SELECT [project_id], [project_name], [Description], [Status], [estimated_launch] FROM [dbo].[tblStartupProjects]";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stm = conn.prepareStatement(sql);
                ResultSet rs = stm.executeQuery()) {

            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                String projectName = rs.getString("project_name");
                String description = rs.getString("description");
                String status = rs.getString("status");
                Date estimatedLaunch = rs.getDate("estimated_launch");

                projectList.add(new StartupProjectsDTO(projectId, projectName, description, status, estimatedLaunch));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return projectList;
    }

}
