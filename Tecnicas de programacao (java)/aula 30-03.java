int menordata = Integer.MAX_VALUE;
    int nome_funcionario_mais_velho = 0;

    
    ArrayList funcionarios = new ArrayList();
    ArrayList datas = new ArrayList();

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        // TODO add your handling code here:

        int i;
        
        for(i = 0; i < datas.size(); i++) {
            if((int)datas.get(i) < menordata){
                menordata = (int) datas.get(i);
                nome_funcionario_mais_velho = i;
            }
        }
        String mensagem = String.format("Funcionário mais velho: %s\nMenor data: %d", funcionarios.get(nome_funcionario_mais_velho), menordata);
        JOptionPane.showMessageDialog(null, mensagem);
    }