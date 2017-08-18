package java_training;

import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Image;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;

import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.ImageIcon;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JLabel;

public class ViewEmployee extends JFrame {

	private JPanel contentPane;
	private static int index = 0;
	private static employee [] employeeToDisplay =null;
	
	private static JLabel outImage = new JLabel("");
	private JLabel txtId = new JLabel("ID");
	private static JLabel outId = new JLabel("");
	private JLabel txtName = new JLabel("Name");
	private JLabel txtColon1 = new JLabel(":");
	private JLabel txtColon2 = new JLabel(":");
	private static JLabel outName = new JLabel("");
	
	private static void showEmployee(){
		outId.setText(employeeToDisplay[index].getId()+"");
		outName.setText(employeeToDisplay[index].getName()+"");
		
		try{
			
			BufferedImage img = ImageIO.read(new ByteArrayInputStream(employeeToDisplay[index].getPhoto()));
			img.getScaledInstance(img.getWidth(), img.getHeight(), Image.SCALE_DEFAULT);
			ImageIcon icon = new ImageIcon(img);
			outImage.setIcon(icon);
		}
		catch (Exception e) {  
	         e.printStackTrace();  
	    }
	}
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ViewEmployee frame = new ViewEmployee();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		try{
			database db =new database();
			int[] listEmployeeId = db.getAllEmployeeID();
			employeeToDisplay = new employee[listEmployeeId.length];
			for (int i=0; i< listEmployeeId.length; i++){
				employeeToDisplay[i] = db.getEmployeeFromDB(listEmployeeId[i]);
			}
			showEmployee();
		}catch (Exception e) {  
	         e.printStackTrace();  
	    }
	}

	/**
	 * Create the frame.
	 */
	public ViewEmployee() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		
		JButton button = new JButton(">");
		button.addActionListener(new ActionListener() {
			public void actionPerformed1(ActionEvent arg0) {
				if(index+1<=employeeToDisplay.length)
				{
					index = index +1;
					showEmployee();
				}
			}

			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		JButton button_1 = new JButton("<");
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if(index-1>=0)
				{
					index = index -1;
					showEmployee();
				}
			}
		});
		
		GroupLayout gl_contentPane = new GroupLayout(contentPane);
		gl_contentPane.setHorizontalGroup(
			gl_contentPane.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_contentPane.createSequentialGroup()
					.addContainerGap()
					.addGroup(gl_contentPane.createParallelGroup(Alignment.TRAILING)
						.addGroup(gl_contentPane.createSequentialGroup()
							.addComponent(button_1)
							.addPreferredGap(ComponentPlacement.RELATED)
							.addComponent(button)
							.addContainerGap())
						.addGroup(Alignment.LEADING, gl_contentPane.createSequentialGroup()
							.addComponent(outImage, GroupLayout.PREFERRED_SIZE, 103, GroupLayout.PREFERRED_SIZE)
							.addGap(18)
							.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
								.addComponent(txtName, GroupLayout.PREFERRED_SIZE, 34, GroupLayout.PREFERRED_SIZE)
								.addComponent(txtId))
							.addPreferredGap(ComponentPlacement.RELATED)
							.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING, false)
								.addComponent(txtColon2, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 4, Short.MAX_VALUE)
								.addComponent(txtColon1, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
							.addPreferredGap(ComponentPlacement.RELATED)
							.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
								.addComponent(outId)
								.addComponent(outName))
							.addGap(197))))
		);
		gl_contentPane.setVerticalGroup(
			gl_contentPane.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_contentPane.createSequentialGroup()
					.addContainerGap()
					.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
						.addGroup(gl_contentPane.createSequentialGroup()
							.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
								.addComponent(txtId)
								.addComponent(txtColon1, GroupLayout.PREFERRED_SIZE, 14, GroupLayout.PREFERRED_SIZE)
								.addComponent(outId))
							.addPreferredGap(ComponentPlacement.RELATED)
							.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
								.addComponent(txtName)
								.addComponent(txtColon2)
								.addComponent(outName)))
						.addGroup(gl_contentPane.createSequentialGroup()
							.addComponent(outImage, GroupLayout.PREFERRED_SIZE, 117, GroupLayout.PREFERRED_SIZE)
							.addPreferredGap(ComponentPlacement.RELATED, 89, Short.MAX_VALUE)
							.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
								.addComponent(button)
								.addComponent(button_1))))
					.addContainerGap())
		);
		contentPane.setLayout(gl_contentPane);
	}
}
