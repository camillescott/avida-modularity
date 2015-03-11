import pandas as pd
import sys

def parse_avida_cfg(filename):
    '''
    Parse an avida config file in avida format
    and return it in a configkey:configvalue Series
    '''
    cfg_keys = []
    cfg_values = []
    with open(filename, 'r') as fp:
        for n, line in enumerate(fp):
            if line.strip().startswith('#') or not line.strip():
                continue
            else:
                data = line.strip().split()
                try:
                    cfg_keys.append(data[0].strip())
                except IndexError:
                    print >>sys.stderr, 'Warning: Parsing error at line {}. Failure likely imminent'.format(n)
                if len(data) > 1 and not data[1].strip().startswith('#'):
                    cfg_values.append(data[1].strip())
                else:
                    cfg_values.append('')

    return pd.Series(cfg_values, index=cfg_keys)

def cfg_series_to_avida_fmt(cfg_series, fp):
    '''
    Write an avida config series to avida config format
    '''
    cfg_series.to_csv(fp, sep=' ')


# events: use json list of event lines, OR jinja template
# avida.cfg: use json k:v pairs, join on default config
# environemtn: use json list of resource lines, OR jinja template
# analyze: should be static between experiments? (or jinja)
# inst-set: static between experiments

def update_avida_cfg_series(cfg_series, new_config_values):
    assert type(cfg_series) is pd.Series
    for key, value in new_config_values.iteritems():
        try:
            cfg_series[key] = value
        except IndexError as e:
            print >>sys.stderr, 'Unable to update config key {} to value {}'.format(key, value)
