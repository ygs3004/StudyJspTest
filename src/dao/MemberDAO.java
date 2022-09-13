package dao;

import dto.MemberVO;
import util.DBManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static java.lang.System.out;

public class MemberDAO {

    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    private static MemberDAO instance = new MemberDAO();


    public static MemberDAO getInstance(){
        return instance;
    }

    public ArrayList<MemberVO> getAllMember(){
        ArrayList<MemberVO> memberlist=new ArrayList<>();
        MemberVO mvo = null;
        String sql = "SELECT * FROM memberT";

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                mvo = new MemberVO();
                mvo.setId(rs.getString("id"));
                mvo.setPw(rs.getString("pw"));
                mvo.setName(rs.getString("name"));
                mvo.setGender(rs.getString("gender"));
                mvo.setPhone(rs.getString("phone"));
                mvo.setEmail(rs.getString("email"));
                // System.out.println(mvo); // null 체크
                memberlist.add(mvo);
            }

        }catch(Exception e){
            e.printStackTrace();

        }finally {
            DBManager.close(rs, pstmt, conn);
        }

        return memberlist;
    }

    public void insertMember(MemberVO mvo){
        String sql = "INSERT INTO memberT VALUES(?,?,?,?,?,?)";
        //INSERT INTO memberT VALUES('hong','1234','홍길동','남','010-111-1111','hong@naver.com');

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,mvo.getId());
            pstmt.setString(2,mvo.getPw());
            pstmt.setString(3,mvo.getName());
            pstmt.setString(4,mvo.getGender());
            pstmt.setString(5,mvo.getPhone());
            pstmt.setString(6,mvo.getEmail());
            out.println(sql); // query 체크
            pstmt.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();

        }finally {
            DBManager.close(pstmt, conn);
        }

    }

    public MemberVO getMember(String id){
        MemberVO mvo= null;
        String sql = "SELECT * FROM memberT WHERE id=?";

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                String pw = rs.getString("pw");
                String name = rs.getString("name");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String email = rs.getString("email");

                mvo = new MemberVO(id, pw, name, gender, phone, email);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(rs, pstmt, conn);
        }

        return mvo;
    }

    public void deleteMember(String id){
        String sql="DELETE FROM memberT WHERE id=?";

        try{
            conn=DBManager.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();;

        }finally {
            DBManager.close(pstmt,conn);
        }
    }

    public void updateMember(MemberVO mvo){
        String sql = "UPDATE memberT SET pw=?, name=?, gender=?, phone=?, email=? WHERE id=?";

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mvo.getPw());
            pstmt.setString(2, mvo.getName());
            pstmt.setString(3, mvo.getGender());
            pstmt.setString(4, mvo.getPhone());
            pstmt.setString(5, mvo.getEmail());
            pstmt.setString(6, mvo.getId());

            pstmt.executeUpdate();
        }catch (Exception e){

        }finally {
            DBManager.close(pstmt, conn);
        }
    }

    public int userCheck(String id){

        ArrayList<MemberVO> memberlist = getAllMember();
        for(MemberVO mvo : memberlist){
            if(id.equals(mvo.getId())){
                return 1;
            }
        }
        return 0;
    }

}