package member;

import java.util.HashMap;

public interface MemberService {
	//CRUD: Create, Read, Update, Delete
	int member_join(MemberDTO dto);	//회원가입시 회원정보 저장
	MemberDTO member_login(HashMap<String, String> map);//회원정보 로그인
	boolean member_id_check(int id);//회원가입시 아이디 중복확인
	int updateMember(MemberDTO dto);//정보보기에서 회원정보 변경저장
	int member_delete(int id);//회원탈퇴
	boolean member_social_id(MemberDTO dto);//소셜로그인시 회원이메일 존재하는지
	int member_social_insert(MemberDTO dto);//소셜로그인시 회원정보 신규저장
	int member_social_update(MemberDTO dto);//소셜로그인시 회원정보 변경저장
}
