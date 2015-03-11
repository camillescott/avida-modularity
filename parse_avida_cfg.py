import pandas as pd

def parse_avida_cfg(filename):
    cfg_keys = []
    cfg_values = []
    with open(filename, 'r') as fp:
        for line in fp:
            if line.strip().startswith('#') or not line:
                continue
            else:
                data = line.strip().split()
                try:
                    cfg_keys.append(data[0])
                    cfg_values.append(data[1])
                except IndexError:
                    pass
    return pd.Series(values, index=keys)

# events: use json list of event lines, OR jinja template
# avida.cfg: use json k:v pairs, join on default config
# environemtn: use json list of resource lines, OR jinja template
# analyze: should be static between experiments? (or jinja)
# inst-set: static between experiments

def update_avida_config(default_config, new_config_values):
    assert type(default_config) is pd.Series
