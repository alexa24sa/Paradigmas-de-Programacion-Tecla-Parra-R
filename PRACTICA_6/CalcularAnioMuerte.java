import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class CalculoAnioMuerte extends JFrame implements ActionListener {
    // Componentes de la GUI
    private JButton btnSi;
    private JButton btnNo;
    private JTextField txtEdad;
    private JLabel lblResultado;

    public CalculoAnioMuerte() {
        // Configuración inicial de la ventana
        setTitle("Calculo del Anio de Muerte");
        setSize(400, 200); // Ajustado para mejor visualización
        setLayout(new FlowLayout());
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Establecer fuente común
        Font fuente = new Font("Arial", Font.PLAIN, 25);

        // Creación de componentes
        JLabel lblEdad = new JLabel("Ingrese su edad:");
        lblEdad.setFont(fuente); // Aplicar fuente
        add(lblEdad);

        txtEdad = new JTextField(10);
        txtEdad.setFont(fuente); // Aplicar fuente
        add(txtEdad);

        btnSi = new JButton("Si");
        btnSi.setFont(fuente); // Aplicar fuente
        btnNo = new JButton("No");
        btnNo.setFont(fuente); // Aplicar fuente
        btnSi.addActionListener(this);
        btnNo.addActionListener(this);
        add(btnSi);
        add(btnNo);

        lblResultado = new JLabel("Resultado aparecera aqui");
        lblResultado.setFont(fuente); // Aplicar fuente
        add(lblResultado);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        try {
            int edad = Integer.parseInt(txtEdad.getText());
            int anioActual = java.time.Year.now().getValue();
            int esperanzaVida = 75;

            if (e.getSource() == btnSi) { // Si el usuario fuma
                esperanzaVida -= 10;
            }

            int anioMuerte = anioActual + (esperanzaVida - edad);
            lblResultado.setText("Anio estimado de muerte: " + anioMuerte);
        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(this, "Por favor, ingrese una edad valida.");
        }
    }

    public static void main(String[] args) {
        new CalculoAnioMuerte().setVisible(true);
    }
}
