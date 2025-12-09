# ⚡ GTweaks | Advanced Windows Optimization

![Status](https://img.shields.io/badge/Status-Active-brightgreen)
![Version](https://img.shields.io/badge/Version-2.0-blue)
![Platform](https://img.shields.io/badge/Platform-Windows_10%2F11-0078D6)

### 🚀 Transformando Hardware em Performance Pura

**GTweaks** não é apenas um script de limpeza; é uma suíte de otimização desenvolvida profissionalmente para eliminar gargalos do Windows, reduzir latência de entrada (input lag) e maximizar FPS em cenários competitivos.

Este projeto é a base da minha consultoria de otimização, onde aplico configurações granulares ("fine-tuning") que o Windows não expõe ao usuário comum.

---

### 🎯 O que o GTweaks faz

Ao contrário de ferramentas genéricas, o GTweaks atua em camadas profundas do sistema:

* **🗑️ Debloating Cirúrgico:** Remoção forçada de telemetria, Apps UWP inúteis e serviços de background que consomem ciclos de CPU sem permissão.
* **⚡ Otimização de Processos:** Ajuste de prioridade de threads e afinidade de CPU para garantir que o jogo/aplicação tenha acesso exclusivo aos recursos.
* **MSI Mode (Message Signaled Interrupts):** Força a mudança de dispositivos (GPU, NIC) para modo MSI, reduzindo drasticamente a latência de interrupção.
* **Network Tuning:** Ajustes na pilha TCP/IP e desativação do Nagle's Algorithm para menor ping e jitter.

---

### 🛠️ Tech Stack & Arquitetura

O projeto combina a robustez do PowerShell para alterações de baixo nível com a usabilidade do Python.

* **Core:** `PowerShell` (Interação direta com Registry, Services e WMI).
* **Interface:** `Python` + `CustomTkinter` (GUI moderna e responsiva).
* **Automação:** Scripts modulares que detectam a versão do Windows e aplicam os tweaks seguros correspondentes.

---

### 📊 Resultados Esperados

Em testes realizados com clientes da consultoria, observamos consistentemente:

| Métrica | Windows Padrão | Com GTweaks |
| :--- | :---: | :---: |
| **Processos em 2º Plano** | 200+ | < 90 |
| **Consumo de RAM (Idle)** | 4GB+ | ~1.8GB |
| **DPC Latency** | Instável | Estável/Baixa |
| **Input Lag** | Padrão | Otimizado |

---

### ⚠️ Disclaimer & Uso Profissional

Esta ferramenta altera chaves sensíveis do Registro do Windows (Regedit) e políticas de grupo.
*Este repositório contém a versão pública/open-source de algumas ferramentas que utilizo. A versão completa e personalizada faz parte do meu serviço de consultoria privada.*

---

<div align="center">
  <h3>Developed by Guilherme Cunha</h3>
  <p>Especialista em Otimização de Sistemas e Hardening.</p>
  <a href="https://www.linkedin.com/in/guilherme--menezes">
    <img src="https://img.shields.io/badge/Connect-LinkedIn-blue?style=for-the-badge&logo=linkedin" />
  </a>
</div>
