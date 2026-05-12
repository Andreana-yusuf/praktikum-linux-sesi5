import random
from datetime import datetime, timedelta

def generate_csv(n=1000):
    statuses = ['active', 'aktive', 'Active', 'INACTIVE', 'banned', 'active ']
    headers = "id,nama,email,no_hp,tanggal_daftar,status\n"
    rows = [headers]
    
    for i in range(1, n + 1):
        email = f"user{i}@gmail.com" if i % 50 != 0 else f"user{i-1}@gmail.com" # email duplikat tiap 50 baris
        dt = datetime(2026, 5, 10) + timedelta(days=random.randint(0, 30))
        fmt = random.choice(["%d/%m/%Y", "%Y-%m-%d", "%d-%m-%y"])
        nama = f"Customer Name {i}" if i % 10 != 0 else f"customer name {i}"
        rows.append(f"{i},{nama},{email},08123456{i:03d},{dt.strftime(fmt)},{random.choice(statuses)}\n")
    
    with open("data.csv", "w") as f:
        f.writelines(rows)

generate_csv(1000)
