function blk-id
    lsblk -o +UUID | bat -l conf -p
end
