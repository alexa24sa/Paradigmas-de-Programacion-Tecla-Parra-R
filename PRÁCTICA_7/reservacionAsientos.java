import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class reservacionAsientos extends JFrame {
    private JButton[] botones = new JButton[45];  // 44 asientos + 1 botón especial
    private boolean[] estadoAsientos = new boolean[44];  // Estado de cada asiento (reservado o no)

    public reservacionAsientos() {
        setTitle("Reservación de Asientos en Camión");
        setSize(1200, 600);  // Ajustar el tamaño para mejor visualización
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        ImageIcon iconoLibre = scaleImageIcon(new ImageIcon("asiento_libre.png"), 50, 50);
        ImageIcon iconoReservado = scaleImageIcon(new ImageIcon("asiento_reservado.png"), 50, 50);
        ImageIcon fondo = new ImageIcon("bus.jpeg");

        JPanel panel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                g.drawImage(fondo.getImage(), 0, 0, getWidth(), getHeight(), this);
            }
        };
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        panel.setOpaque(false);

        JLabel label = new JLabel("<html><div style='text-align: center;'>Selecciona tu asiento</div></html>");
        label.setFont(new Font("Arial", Font.BOLD, 24));
        label.setAlignmentX(Component.CENTER_ALIGNMENT);
        panel.add(label);

        JPanel buttonPanel = new JPanel(new GridLayout(4, 11, 10, 10));
        buttonPanel.setOpaque(false);

        for (int i = 0; i < 44; i++) {
            botones[i] = new JButton(String.valueOf(i + 1), iconoLibre);
            botones[i].setVerticalTextPosition(SwingConstants.BOTTOM);
            botones[i].setHorizontalTextPosition(SwingConstants.CENTER);
            int numeroAsiento = i + 1;
            botones[i].addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    JButton boton = (JButton) e.getSource();
                    if (!estadoAsientos[numeroAsiento - 1]) {
                        boton.setIcon(iconoReservado);
                        estadoAsientos[numeroAsiento - 1] = true;
                    }
                }
            });
            botones[i].setContentAreaFilled(false);
            botones[i].setBorderPainted(false);
            buttonPanel.add(botones[i]);
        }

        JPanel specialButtonPanel = new JPanel();
        specialButtonPanel.setOpaque(false);
        ImageIcon fondoBoton = scaleImageIcon(new ImageIcon("checklist.png"), 75, 100);
        JButton specialButton = new JButton("Mostrar Reservados", fondoBoton);
        specialButton.setFont(new Font("Arial", Font.PLAIN, 12));
        specialButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //specialButton.setFont(new Font("Arial", Font.BOLD, 25)); // Aumentar el tamaño de la fuente antes de mostrar el mensaje
                StringBuilder reservados = new StringBuilder("Asientos reservados: ");
                for (int j = 0; j < estadoAsientos.length; j++) {
                    if (estadoAsientos[j]) {
                        reservados.append(j + 1).append(" ");
                    }
                }
                JOptionPane.showMessageDialog(null, reservados.toString());
                specialButton.setFont(new Font("Arial", Font.PLAIN, 25)); // Restaurar el tamaño de la fuente después de cerrar el mensaje
            }
        });
        specialButton.setContentAreaFilled(false);
        specialButton.setBorderPainted(false);
        specialButtonPanel.add(specialButton);

        buttonPanel.add(specialButtonPanel);

        panel.add(buttonPanel);
        setContentPane(panel);
        setVisible(true);
    }

    private ImageIcon scaleImageIcon(ImageIcon icon, int width, int height) {
        Image img = icon.getImage();
        Image newImg = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        return new ImageIcon(newImg);
    }

    public static void main(String[] args) {
        new reservacionAsientos();
    }
}
