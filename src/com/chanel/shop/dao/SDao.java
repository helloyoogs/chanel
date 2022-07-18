package com.chanel.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.chanel.shop.dto.CDto;
import com.chanel.shop.dto.SCDto;
import com.chanel.shop.dto.SDto;

public class SDao {

	DataSource datasource;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//BDao 생성하자마자 db 연결에 필요한 객체 생성
	//datasource 통하여 db접속
	public SDao() {
		try {
			Context ctx = new InitialContext();
			datasource = (DataSource)ctx.lookup("java:comp/env/jdbc/mariadb");	
			} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***************** 관리자 설정 시작 *************/
	// 관리자 list
	public ArrayList<SDto> list() {
		ArrayList<SDto> dtos = new ArrayList<SDto>();
		
		try {
			conn = datasource.getConnection();
			
			String sql = "select * from TBL_SHOOSE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				String sId = rs.getString("sId");
				String sName = rs.getString("sName");
				String sImg = rs.getString("sImg");
				int sSize = rs.getInt("sSize");
				int sPrice = rs.getInt("sPrice");
				int sStock = rs.getInt("sStock");
				String memberId = rs.getString("memberId");

				SDto dto = new SDto(sId, sName, sImg, sSize, sPrice, sStock, memberId);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		
		
		return dtos;
	}
	
	//관리자 list 수정list
	public SDto contentView(String sId) {
		SDto dto = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "select * from TBL_SHOOSE where sId=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sId); //글번호
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String sName = rs.getString("sName");
				String sImg = rs.getString("sImg");
				int sSize = rs.getInt("sSize");
				int sPrice = rs.getInt("sPrice");
				int sStock = rs.getInt("sStock");
				String memberId = rs.getString("memberId");

				dto = new SDto(sId, sName, sImg, sSize, sPrice, sStock, memberId);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
	}
	
	
	
	//관리자 list 수정
	public void modify(String sId, String sName, String sImg, String sSize, String sPrice, String sStock, String memberId) {
		try {
			conn = datasource.getConnection();
			//bId를 기준으로 글쓴이(=bName), 제목(=bTitle), 내용(bContent) 부분을 변경하고자 함.
			String sql = "update TBL_SHOOSE set sName=?, sImg=?, sSize=?, sPrice=?, sStock=?,memberId=? where sId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sName);
			pstmt.setString(2,sImg);
			pstmt.setInt(3, Integer.parseInt(sSize));//bId값은 int이므로 setString대신 setInt를 쓴다.
			pstmt.setInt(4, Integer.parseInt(sPrice));
			pstmt.setInt(5, Integer.parseInt(sStock));
			pstmt.setString(6, memberId);
			pstmt.setString(7,sId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}	
	
	//관리자용 : 상품 입력 및 관리 기능
	public void write(String sId, String sName, String sImg, String sSize, String sPrice, String sStock, String memberId) {
		try {
			conn=datasource.getConnection();
			String sql = "insert into TBL_SHOOSE(sId,sName,sImg,sSize,sPrice,sStock,memberId) values (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sId);
			pstmt.setString(2,sName);
			pstmt.setString(3,sImg);
			pstmt.setInt(4, Integer.parseInt(sSize));//bId값은 int이므로 setString대신 setInt를 쓴다.
			pstmt.setInt(5, Integer.parseInt(sPrice));
			pstmt.setInt(6, Integer.parseInt(sStock));
			pstmt.setString(7,memberId);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	//관리자 상품 삭제(delete)
	public void delete(String sId) {
		try {
			System.out.println(sId);
			conn = datasource.getConnection();
			String sql = "delete from TBL_SHOOSE where sId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sId);
			pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//rs를 close하는 건 rs가 null인지 아닌지 체크도 해야 하고, select를 할 거 아니면 rs는 아예 쓰지도 않음.
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/***************** 관리자 설정 끝 *************/
	
	/***************** 장바구니 설정 시작 *************/
			//유저장바구니목록
			public ArrayList<SCDto> cart(String memberId) {
				ArrayList<SCDto> dtos = new ArrayList<SCDto>();
				
				try {
					conn = datasource.getConnection();
					String sql = "select a.sName, a.sImg, a.sSize, a.sPrice, a.sStock, b.cId, b.cQuantity,b.cPayment,b.cDate, b.cPriceAll,b.sId, b.memberId"
							+ " from TBL_SHOOSE a join TBL_CART b on a.sId = b.sId where b.memberId= ? and b.cPayment = '미결제'";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memberId); 
					rs = pstmt.executeQuery(); 
					while(rs.next()) {
						String sName = rs.getString("sName");
						String sImg = rs.getString("sImg");
						int sSize = rs.getInt("sSize");
						int sPrice = rs.getInt("sPrice");
						int sStock = rs.getInt("sStock");
						int cId = rs.getInt("cId");
						int cQuantity = rs.getInt("cQuantity");
						int cPriceAll = rs.getInt("cPriceAll");
						String cPayment = rs.getString("cPayment");
						Timestamp cDate = rs.getTimestamp("cDate");
						String sId = rs.getString("sId");
						
						sStock = sStock - cQuantity;
						cPriceAll = sPrice * cQuantity;
						SCDto dto = new SCDto(sName, sImg, sSize, sPrice, sStock, cId, cQuantity, cPriceAll, cPayment, cDate, sId, memberId);
						dtos.add(dto);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}

				return dtos;
			}
			
			//유저장바구니 submit 시 생성(write_view 부분)
			public void write1(String cQuantity,String cPriceAll,String sId,String memberId) {
				try {
					conn=datasource.getConnection();
					String sql = "insert into TBL_CART(cId,cQuantity,cPriceAll,sId,memberId) values (nextval('TBL_CART'),?,?,?,?)";
					pstmt = conn.prepareStatement(sql);	
					pstmt.setInt(1, Integer.parseInt(cQuantity));
					pstmt.setInt(2, Integer.parseInt(cPriceAll));
					pstmt.setString(3, sId);
					pstmt.setString(4, memberId);
					pstmt.executeUpdate();
					

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
			//유저장바구니 submit 시 생성(write_view 부분)
			public void write2(String cQuantity,String cPriceAll,String sId,String memberId) {
				try {
					conn=datasource.getConnection();
					String sql = "insert into TBL_CART(cId,cQuantity,cPriceAll,sId,memberId) values (nextval('TBL_CART'),?,?,?,?)";
					pstmt = conn.prepareStatement(sql);	
					pstmt.setInt(1, Integer.parseInt(cQuantity));
					pstmt.setInt(2, Integer.parseInt(cPriceAll));
					pstmt.setString(3, sId);
					pstmt.setString(4, memberId);
					pstmt.executeUpdate();
					

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
			//유저장바구니 submit 시 생성(write_view 부분)
			public void write3(String cQuantity,String cPriceAll,String sId,String memberId) {
				try {
					conn=datasource.getConnection();
					String sql = "insert into TBL_CART(cId,cQuantity,cPriceAll,sId,memberId) values (nextval('TBL_CART'),?,?,?,?)";
					pstmt = conn.prepareStatement(sql);	
					pstmt.setInt(1, Integer.parseInt(cQuantity));
					pstmt.setInt(2, Integer.parseInt(cPriceAll));
					pstmt.setString(3, sId);
					pstmt.setString(4, memberId);
					pstmt.executeUpdate();
					

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
			//유저장바구니 submit 시 생성(write_view 부분)
			public void write4(String cQuantity,String cPriceAll,String sId,String memberId) {
				try {
					conn=datasource.getConnection();
					String sql = "insert into TBL_CART(cId,cQuantity,cPriceAll,sId,memberId) values (nextval('TBL_CART'),?,?,?,?)";
					pstmt = conn.prepareStatement(sql);	
					pstmt.setInt(1, Integer.parseInt(cQuantity));
					pstmt.setInt(2, Integer.parseInt(cPriceAll));
					pstmt.setString(3, sId);
					pstmt.setString(4, memberId);
					pstmt.executeUpdate();
					

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
			//유저장바구니 submit 시 생성(write_view 부분)
			public void write5(String cQuantity,String cPriceAll,String sId,String memberId) {
				try {
					conn=datasource.getConnection();
					String sql = "insert into TBL_CART(cId,cQuantity,cPriceAll,sId,memberId) values (nextval('TBL_CART'),?,?,?,?)";
					pstmt = conn.prepareStatement(sql);	
					pstmt.setInt(1, Integer.parseInt(cQuantity));
					pstmt.setInt(2, Integer.parseInt(cPriceAll));
					pstmt.setString(3, sId);
					pstmt.setString(4, memberId);
					pstmt.executeUpdate();
					

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
			//유저장보구니 list 수정list (content_view 부분)
			public CDto content_view(String sId) {
				CDto dto = null;
				
				try {
					conn = datasource.getConnection();
					String sql = "select * from TBL_CART where cId= ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sId);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						int cId = rs.getInt("cId");
						int cQuantity = rs.getInt("cQuantity");
						int cPriceAll = rs.getInt("cPriceAll");
						String memberId = rs.getString("memberId");
						
						dto = new CDto(cId, cQuantity, cPriceAll, sId, memberId);
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				
				return dto;
			}

			
			//유저장바구니 수정(modify)
			public void modify(String cId, String cQuantity, String cPriceAll, String cPayment) {
				try {
					conn = datasource.getConnection();
					//bId를 기준으로 글쓴이(=bName), 제목(=bTitle), 내용(bContent) 부분을 변경하고자 함.
					String sql = "update TBL_CART set cQuantity=?,cPriceAll=?,cPayment=? where cId=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(cQuantity));
					pstmt.setInt(2, Integer.parseInt(cPriceAll));
					pstmt.setString(3,cPayment);
					pstmt.setInt(4, Integer.parseInt(cId));
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
			//장바구니 삭제(delete)
			public void Cdelete(String cId) {
				try {
					System.out.println(cId);
					conn = datasource.getConnection();
					String sql = "delete from TBL_CART where cId=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(cId));
					pstmt.executeUpdate(); 
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						//rs를 close하는 건 rs가 null인지 아닌지 체크도 해야 하고, select를 할 거 아니면 rs는 아예 쓰지도 않음.
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
			
			

			/***************** 장바구니 설정 끝 *************/
			
			/************상품 구매 설정************/
			//상품 결제확인 페이지1
			public ArrayList<SCDto> order(String memberId) {
				ArrayList<SCDto> dtos = new ArrayList<SCDto>();
				
				try {
					conn = datasource.getConnection();
					String sql = "select a.sName, a.sImg, a.sSize, a.sPrice, a.sStock, b.cId, b.cQuantity,b.cPayment,b.cDate, b.cPriceAll,b.sId, b.memberId"
							+ " from TBL_SHOOSE a join TBL_CART b on a.sId = b.sId where b.memberId= ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memberId); 
					rs = pstmt.executeQuery(); 
					while(rs.next()) {
						String sName = rs.getString("sName");
						String sImg = rs.getString("sImg");
						int sSize = rs.getInt("sSize");
						int sPrice = rs.getInt("sPrice");
						int sStock = rs.getInt("sStock");
						int cId = rs.getInt("cId");
						int cQuantity = rs.getInt("cQuantity");
						int cPriceAll = rs.getInt("cPriceAll");
						String cPayment = rs.getString("cPayment");
						Timestamp cDate = rs.getTimestamp("cDate");
						String sId = rs.getString("sId");
						
						sStock = sStock - cQuantity;
						cPriceAll = sPrice * cQuantity;
						SCDto dto = new SCDto(sName, sImg, sSize, sPrice, sStock, cId, cQuantity, cPriceAll, cPayment, cDate, sId, memberId);
						dtos.add(dto);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						pstmt.close();
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}

				return dtos;
			}
			
			//상품 결제확인 페이지1
				public void order_modify(String cId, String cQuantity, String cPriceAll, String cPayment) {
					try {
						conn = datasource.getConnection();
						String sql = "update TBL_CART set cQuantity=?,cPriceAll=?,cPayment=? where cId=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, Integer.parseInt(cQuantity));
						pstmt.setInt(2, Integer.parseInt(cPriceAll));
						pstmt.setString(3,cPayment);
						pstmt.setInt(4, Integer.parseInt(cId));
						pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							pstmt.close();
							conn.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
				}
		 
				//유저 구매목록 페이지
				public ArrayList<SCDto> order_list(String memberId) {
					ArrayList<SCDto> dtos1 = new ArrayList<SCDto>();
					
					try {
						conn = datasource.getConnection();
						String sql = "select a.sName, a.sImg, a.sSize, a.sPrice, a.sStock, b.cId, b.cQuantity,b.cPayment,b.cDate, b.cPriceAll,b.sId, b.memberId"
								+ " from TBL_SHOOSE a join TBL_CART b on a.sId = b.sId where b.memberId= ? and b.cPayment = '결제' order by b.cDate";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, memberId); 
						rs = pstmt.executeQuery(); 
						while(rs.next()) {
							String sName = rs.getString("sName");
							String sImg = rs.getString("sImg");
							int sSize = rs.getInt("sSize");
							int sPrice = rs.getInt("sPrice");
							int sStock = rs.getInt("sStock");
							int cId = rs.getInt("cId");
							int cQuantity = rs.getInt("cQuantity");
							int cPriceAll = rs.getInt("cPriceAll");
							String cPayment = rs.getString("cPayment");
							Timestamp cDate = rs.getTimestamp("cDate");
							String sId = rs.getString("sId");
							
							sStock = sStock - cQuantity;
							cPriceAll = sPrice * cQuantity;
							SCDto dto = new SCDto(sName, sImg, sSize, sPrice, sStock, cId, cQuantity, cPriceAll, cPayment, cDate, sId, memberId);
							dtos1.add(dto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							rs.close();
							pstmt.close();
							conn.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}

					return dtos1;
				}
				//전체 결과 리스트
				public ArrayList<SCDto> total_list() {
					ArrayList<SCDto> dtos2 = new ArrayList<SCDto>();
					
					try {
						conn = datasource.getConnection();
						String sql = "select a.sName, a.sImg, a.sSize, a.sPrice, a.sStock, b.cId, b.cQuantity,b.cPayment,b.cDate, b.cPriceAll,b.sId, b.memberId"
								+ " from TBL_SHOOSE a join TBL_CART b on a.sId = b.sId";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
						while(rs.next()) {
							String sName = rs.getString("sName");
							String sImg = rs.getString("sImg");
							int sSize = rs.getInt("sSize");
							int sPrice = rs.getInt("sPrice");
							int sStock = rs.getInt("sStock");
							int cId = rs.getInt("cId");
							int cQuantity = rs.getInt("cQuantity");
							int cPriceAll = rs.getInt("cPriceAll");
							String cPayment = rs.getString("cPayment");
							Timestamp cDate = rs.getTimestamp("cDate");
							String sId = rs.getString("sId");
							String memberId = rs.getString("memberId");
							
							sStock = sStock - cQuantity;
							cPriceAll = sPrice * cQuantity;
							SCDto dto = new SCDto(sName, sImg, sSize, sPrice, sStock, cId, cQuantity, cPriceAll, cPayment, cDate, sId, memberId);
							dtos2.add(dto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							rs.close();
							pstmt.close();
							conn.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}

					return dtos2;
				}
} //all End






