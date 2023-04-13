<# Este script altera o nome do computador no Active Directory e no computador local 
sem afetar o trabalho do usuario
v1 
by: michel#> 

<# 
- Passo 1: O Script vai ler a entrada do computador que você deseja renomear
- Passo 2: O Script vai pedir para que você informe o nome do novo computador 
- Passo 3: O Script vai pedir para que você confirme a alteração
- Passo 4: O Script vai informar no powershell se foi executado com vigor a alteração
- Passo 5: O Script vai perguntar se você deseja reiniciar a máquina para as alterações entrarem em vigor. (Digite sim para confirmar ou não para não reiniciar o pc)
- Passo 6: Se você informar que sim ou que não deseja reiniciar o computador o script faz o comando e retorna para o passo 1 e continua nesse loop até fechar o programa.

- Altere o campo domain comentado com a sua id de rede para executar as alterações
#>

Set-ExecutionPolicy -Scope CurrentUser Unrestricted -Confirm -Force

  for( $num = 1; $num -le 200; $num ++){
    
    Write-Host "Vezes alteradas $num "

      $name_pc = Read-host "Informe o nome do computador "
       Write-Host "Vai mudar o nome deste computador  ", $name_pc
        $new_name = Read-host "informe o nome do novo computador "
        $domain_credential = Read-Host "Credencial de Administrador de dominio"
        
            Write-Host "Deseja continuar? "
              $answer = Read-Host 
        
                if($answer -eq "sim")
                  {Rename-Computer -ComputerName $name_pc -NewName $new_name -DomainCredential $domain_credential -Force
        
       
                    Write-Host "Deseja reiniciar a maquina para as alteracoes entrarem em vigor? "
                        $answer_2 = Read-Host
          
                            if($answer_2 -eq "sim"){Restart-Computer -ComputerName $name_pc -Confirm -Credential $domain_credential -Force  }

                                elseif($answer_2 -eq "nao"){Write-Host "Continue"}
}
            else{
    
            Write-Host "O programa acabou" 
            Start-Sleep -Seconds 1
            Exit
     }
       
       
     
     
    }
  
