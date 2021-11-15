import matplotlib.pyplot as plt


def gen_plot(files):
    for file in files:
        with open(file, "r") as f:
            lines = f.readlines()
            x = list(map(int, lines[0].split(',')[1:]))
            for line in lines[1:]:
                ls = line.strip('\n').split(',')
                label = ls[0]
                y = list(map(float, ls[1:]))
                n = len(y)
                plt.plot(x[:n], y[:n], marker='o', label=label)
            plt.legend()
            plt.show()


def gen_block_size_plot():
    files = ['block_size_trace2.csv']
    plt.title("Miss rate as increasing block size (trace2)")
    plt.xlabel('Block size (bytes)')
    plt.ylabel('Miss rate')
    gen_plot(files)


def gen_associativity_plot():
    files = ['associativity_trace2.csv']
    plt.title("Miss rate as increasing associativity (trace2)")
    plt.xlabel('Associativity')
    plt.ylabel('Miss rate')
    gen_plot(files)


def gen_write_policy_plot():
    files = ['write_policy_trace1.csv']
    plt.title("Total access time with different write policy (trace1)")
    plt.xlabel('Block size (bytes)')
    plt.ylabel('Access time (million cycles)')
    gen_plot(files)


# gen_block_size_plot()
# gen_associativity_plot()
gen_write_policy_plot()
