#!/data/data/com.termux/files/usr/bin/bash
# Script minimalista de sincronização Git para Termux

# Mensagem do commit (padrão se não passar nada)
MSG=${1:-"Commit de teste"}

echo "🔹 Adicionando arquivos..."
git add .

echo "🔹 Fazendo commit..."
if git commit -m "$MSG" --quiet 2>/dev/null; then
    HASH=$(git rev-parse --short HEAD)
    echo "✅ Commit realizado com sucesso: $HASH"
else
    echo "ℹ️ Nenhuma alteração para commitar"
fi

echo "🔹 Enviando para o GitHub..."
if git push -u origin main --quiet; then
    echo "🚀 Push concluído!"
else
    echo "❌ Erro ao enviar, verifique!"
fi
