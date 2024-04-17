import numpy as np
import matplotlib.pyplot as plt
data_redge = np.loadtxt("fake-spectra-redge/f_statistic.txt").T
f_stat = 6.587549448
data_redge_bool = [data_redge > f_stat]
data_no_redge = np.abs(np.loadtxt("fake-spectra-no-redge/f_statistic.txt").T)
data_no_redge_bool = [data_no_redge > f_stat]
#print(data)
p_val_redge = np.mean(data_redge_bool)
p_val_no_redge = np.mean(data_no_redge_bool)
print(p_val_redge, p_val_no_redge)

fig = plt.figure(figsize=(12,8))
ax1 = fig.add_subplot(121)
ax1.hist(data_redge, histtype="step", density=True, bins=200, lw=1)
ax1.axvline(f_stat, ls="--", color='k', lw=2)
ax1.text(50, 0.04, f"{p_val_redge*100} %")
ax1.set_title("Null model: With redge")
ax1.set_xlabel("F-statistic")

ax2 = fig.add_subplot(122)
ax2.hist(data_no_redge, histtype="step", density=True, bins=500, lw=1)
ax2.axvline(f_stat, ls="--", color='k', lw=2)
ax2.text(8, 0.9, f"{np.round(p_val_no_redge*100, 4)} %")
ax2.set_xlim(0, 10)
ax2.set_title("Null model: Without redge")
ax2.set_xlabel("F-statistic")
plt.show()