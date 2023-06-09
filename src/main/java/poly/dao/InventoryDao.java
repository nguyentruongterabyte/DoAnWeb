package poly.dao;

import java.util.List;


import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.entity.Inventory;
import poly.message.Message;

@Transactional
@Repository
public class InventoryDao {
	@Autowired
	private SessionFactory factory;
	
	public List<Inventory> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Inventory";
		
		Query query = session.createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Inventory> list = query.list();
		
		return list;
	}
	
	public Inventory get(int id) {
		Session session = factory.getCurrentSession();
		Inventory i = (Inventory) session.get(Inventory.class, (Integer) id);
		return i;
	}
	
	public int getMaxId() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("SELECT max(i.id) FROM Inventory i");
		
		if (query.uniqueResult() == null)
			return 0;
		
		int maxId = (int) query.uniqueResult();
		return maxId;
	}
	
	public Message save(Inventory inventory) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Message message = new Message();
		try {
			session.save(inventory);
			t.commit();
			message.setType("success");
			message.setContent("Thêm mới kho hàng thành công!");
		} catch (Exception e) {
			t.rollback();
			message.setType("error");
			message.setContent("Thêm mới thất bại!");
		} finally {
			session.close();
		}
		return message;
	}
	
	public Message update(Inventory inventory) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Message message = new Message();
		try {
			session.update(inventory);
			t.commit();
			message.setType("success");
			message.setContent("Cập nhật kho hàng thành công!");
		} catch (Exception e) {
			t.rollback();
			message.setType("error");
			message.setContent("Cập nhật thất bại!");
		} finally {
			session.close();
		}
		return message;
	}
	
	public Message delete(int inventoryId) {
		Inventory i = this.get(inventoryId);
		/*
		 // test xem i có được get không
		System.out.println(i.getName());
		*/
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Message message = new Message();
		if (i.getInOutInventories().toArray().length > 0) {
			message.setType("error");
			message.setContent("Không thể xóa kho hàng vì đã tồn tại đơn nhập xuất!");
			return message;
		}
		
		if (i.getInventoryCapabilities().toArray().length > 0) {
			message.setType("error");
			message.setContent("Không thể xóa kho hàng vì đã tồn tại sản phẩm!");
			return message;
		}
		
		try {
			i.setInventoryCapabilities(null);
			i.setInOutInventories(null);
			session.delete(i);
			t.commit();
			message.setType("success");
			message.setContent("Xóa kho hàng "+  i.getName()+ "thành công!\n");
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			message.setType("error");
			message.setContent("Xóa thất bại!\n" + e);
		} finally {
			session.close();
		}
		return message;
	}
}
