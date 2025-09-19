#!/data/data/com.termux/files/usr/bin/bash
# Script minimalista de sincronização Git (versão silenciosa com SSH)

# Mensagem do commit (padrão se não passar nada)
MSG=${1:-"Commit de teste"}

# Detecta branch atual (main ou master)
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

echo "🔄 Adicionando arquivos..."
git add . --quiet

echo "📝 Fazendo commit..."
if git commit -m "$MSG" --quiet 2>/dev/null; then
    HASH=$(git rev-parse --short HEAD)
    echo "✅ Commit realizado com sucesso: $HASH"
else
    echo "ℹ️ Nenhuma alteração para commitar"
fi

echo "🚀 Enviando para o GitHub..."
if git push origin "$BRANCH" --quiet >/dev/null; then
    echo "🎉 Push concluído com sucesso!"
else
    echo "❌ Erro ao enviar, verifique!"
fi
