import pandas

'''
Columns:
n  IP  inst  AX  BX  CX  R-Head  W-Head  F-Head  S0  S1  cur_stack  mem  meritbase  bonus  errors  donates  env_in  buf_in  out
'''

def perror(ln, expected, actual):
    raise IOError('''Parsing error at line {ln}.
                     Expected {e}, got {a}'''.format(ln=ln, e=expected, a=actual))

def tracefile_iter(handle, line=None):

    gen = enumerate(handle)
    data = []
    if line is None:
        n, line = gen.next()

    while line:
        data = {}
        
        if not line.startswith('-------'):
            perror(n, 'divider line', line)

        n, line = gen.next()
        if line.startswith('U:'):
            # Not sure what this does, ignoring for now
            pass
        elif line.strip().startswith('MeritBase'):
            # end of file, for now ignore final state
            return
        else:
            perror(n, 'U: or MeritBase', line)

        n, line = gen.next()
        try:
            tokens = line.split()
            data['idx'] = tokens[0].strip()
            data['IP'] = tokens[1].split(':')[1].strip()
            data['inst'] = tokens[2].strip(' ()')
        except Exception as e:
            perror(n, 'IP line', line)
        
        n, line = gen.next()
        try:
            tokens = line.split()
            data['AX'] = tokens[0].split(':')[1].strip()
            data['BX'] = tokens[2].split(':')[1].strip()
            data['CX'] = tokens[4].split(':')[1].strip()
        except Exception as e:
            perror(n, 'register line', line)

        n, line = gen.next()
        try:
            tokens = line.split()
            data['R-Head'] = tokens[0].split(':')[1].strip()
            data['W-Head'] = tokens[1].split(':')[1].strip()
            data['F-Head'] = tokens[2].split(':')[1].strip()
        except Exception as e:
            perror(n, '*-Head line', line)

        n0, s0_line = gen.next()
        n1, s1_line = gen.next()
        try:
            s0_tokens = s0_line.split(':')
            s1_tokens = s1_line.split(':')
            if s0_tokens[0].startswith('*'):
                data['cur_stack'] = 0
            else:
                data['cur_stack'] = 1
            data['S0'] = s0_tokens[1].strip().split()
            data['S1'] = s1_tokens[1].strip().split()
        except Exception as e:
            perror(n1 + ',' + n2, 'stack contents', s0_line)

        n, line = gen.next()
        try:
            tokens = line.split(':')
            data['len'] = tokens[0].strip().split()[1].strip('()')
            data['mem'] = tokens[1].strip()
        except Exception as e:
            perror(n, 'mem line', line)

        n, line = gen.next()
        try:
            tokens = line.split()
            data['MeritBase'] = tokens[0].split(':')[1].strip()
            data['Bonus'] = tokens[1].split(':')[1].strip()
            data['Errors'] = tokens[2].split(':')[1].strip()
            data['Donates'] = tokens[3].split(':')[1].strip()
        except Exception as e:
            perror(n, 'Merit line', line)

        _, _ = gen.next() # skip task count for now
        _, _ = gen.next() # skip empty line

        n, line = gen.next()
        tokens = line.strip().split(':')
        try:
            data['input_env'] = tokens[1].strip().split()
        except IndexError as e:
            # No data
            data['input_env'] = []
        except Exception as e:
            perror(n, 'env input line', line)

        n, line = gen.next()
        tokens = line.strip().split(':')
        try:
            data['input_buf'] = tokens[1].strip().split()
        except IndexError as e:
            # No data
            data['input_buf'] = []
        except Exception as e:
            perror(n, 'input buf line', line)

        n, line = gen.next()
        tokens = line.strip().split(':')
        try:
            data['output'] = tokens[1].strip().split()
        except IndexError as e:
            # No data, put in None
            data['output'] = None
        except Exception as e:
            perror(n, 'output line', line)

        n, line = gen.next()

        yield data


        

 
 
            
            
