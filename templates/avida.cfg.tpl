#############################################################################
# This file includes all the basic run-time definitions for Avida.
# For more information, see documentation/config.html
#############################################################################

VERSION_ID 2.12.4 (Pre-Systematics API EOL)   # Do not change this value.

### GENERAL_GROUP ###
# General Settings
VERBOSITY 1       # 0 = No output at all
                  # 1 = Normal output
                  # 2 = Verbose output, detailing progress
                  # 3 = High level of details, as available
                  # 4 = Print Debug Information, as applicable
RANDOM_SEED 0     # Random number seed (0 for based on time)
SPECULATIVE 1     # Enable speculative execution
                  # (pre-execute instructions that don't affect other organisms)
POPULATION_CAP 0  # Carrying capacity in number of organisms (use 0 for no cap)
POP_CAP_ELDEST 0  # Carrying capacity in number of organisms (use 0 for no cap). Will kill oldest organism in population, but still use birth method to place new offspring.

### TOPOLOGY_GROUP ###
# World topology
WORLD_X 60                  # Width of the Avida world
WORLD_Y 60                  # Height of the Avida world
WORLD_GEOMETRY 2            # 1 = Bounded Grid (WOLRD_X x WORLD_Y)
                            # 2 = Toroidal Grid (WOLRD_X x WORLD_Y; wraps at edges
                            # 3 = Clique (all population cells are connected)
                            # 4 = Hexagonal grid
                            # 5 = Partial
                            # 6 = 3D Lattice (under development)
                            # 7 = Random connected
                            # 8 = Scale-free (detailed below)
SCALE_FREE_M 3              # Number of connections per cell in a scale-free geometry
SCALE_FREE_ALPHA 1.0        # Attachment power (1=linear)
SCALE_FREE_ZERO_APPEAL 0.0  # Appeal of cells with zero connections

### CONFIG_FILE_GROUP ###
# Other configuration Files
DATA_DIR data                     # Directory in which config files are found
EVENT_FILE events.cfg             # File containing list of events during run
ANALYZE_FILE analyze.cfg          # File used for analysis mode
ENVIRONMENT_FILE environment.cfg  # File that describes the environment
MIGRATION_FILE -                  # NxN file that describes connectivity weights between demes

INST_SET inst_gen_arch.cfg

### MUTATION_GROUP ###
# Mutation rates
COPY_MUT_PROB {% if copy_mut.sub %} {{ copy_mut.sub }} {% else %} 0.0 {% endif %}            # Substitution rate (per copy)
COPY_INS_PROB {% if copy_mut.ins %} {{ copy_mut.ins }} {% else %} 0.0 {% endif %}               # Insertion rate (per copy)
COPY_DEL_PROB {% if copy_mut.del %} {{ copy_mut.del }} {% else %} 0.0 {% endif %}               # Deletion rate (per copy)
COPY_UNIFORM_PROB 0.0          # Uniform mutation probability (per copy)
                               # - Randomly apply insertion, deletion or substition mutation
COPY_SLIP_PROB 0.0             # Slip rate (per copy)
POINT_MUT_PROB 0.0             # Point (Cosmic-Ray) substitution rate (per-location per update)
POINT_INS_PROB 0.0             # Point (Cosmic-Ray) insertion rate (per-location per update)
POINT_DEL_PROB 0.0             # Point (Cosmic-Ray) deletion rate (per-location per update)
INST_POINT_MUT_PROB 0.0        # Mutation rate (per-location per time instruction (point-mut) is executed)
INST_POINT_MUT_SLOPE 0.0       # Slope for point mutation rate
INST_POINT_REPAIR_COST 0       # The cost, in cycles, of avoiding mutations when the point-mut instruction is executed
POINT_MUT_REPAIR_START 0       # The starting condition for repairs (on=1; off=0)
DIV_MUT_PROB {% if div_mut.sub %} {{ div_mut.sub }} {% else %} 0.0025 {% endif %} # Substitution rate (per site, applied on divide)
DIV_INS_PROB {% if div_mut.ins %} {{ div_mut.ins }} {% else %} 0.0025 {% endif %}               # Insertion rate (per site, applied on divide)
DIV_DEL_PROB {% if div_mut.del %} {{ div_mut.del }} {% else %} 0.0025 {% endif %}               # Deletion rate (per site, applied on divide)
DIV_UNIFORM_PROB 0.0           # Uniform mutation probability (per site, applied on divide)
                               # - Randomly apply insertion, deletion or point mutation
DIV_SLIP_PROB 0.0              # Slip rate (per site, applied on divide)
DIV_TRANS_PROB 0.0             # Translocation rate (per site, applied on divide)
DIV_LGT_PROB 0.0               # Lateral Gene Transfer rate (per site, applied on divide)
DIVIDE_MUT_PROB {% if divide_mut.sub %} {{ divide_mut.sub }} {% else %} 0.0 {% endif %}            # Substitution rate (max one, per divide)
DIVIDE_INS_PROB {% if divide_mut.ins %} {{ divide_mut.ins }} {% else %} 0.0 {% endif %}           # Insertion rate (max one, per divide)
DIVIDE_DEL_PROB {% if divide_del.sub %} {{ divide_del.sub }} {% else %} 0.0 {% endif %}           # Deletion rate (max one, per divide)
DIVIDE_UNIFORM_PROB 0.0        # Uniform mutation probability (per divide)
                               # - Randomly apply insertion, deletion or point mutation
DIVIDE_SLIP_PROB 0.0           # Slip rate (per divide) - creates large deletions/duplications
DIVIDE_TRANS_PROB 0.0          # Translocation rate (per divide) - creates large deletions/duplications
DIVIDE_LGT_PROB 0.0            # Lateral Gene Transfer rate (per divide) - creates large deletions/duplications
DIVIDE_POISSON_MUT_MEAN 0.0    # Substitution rate (Poisson distributed, per divide)
DIVIDE_POISSON_INS_MEAN 0.0    # Insertion rate (Poisson distributed, per divide)
DIVIDE_POISSON_DEL_MEAN 0.0    # Deletion rate (Poisson distributed, per divide)
DIVIDE_POISSON_SLIP_MEAN 0.0   # Slip rate (Poisson distributed, per divide)
DIVIDE_POISSON_TRANS_MEAN 0.0  # Translocation rate (Poisson distributed, per divide)
DIVIDE_POISSON_LGT_MEAN 0.0    # Lateral Gene Transfer rate (Poisson distributed, per divide)
INJECT_MUT_PROB 0.0            # Substitution rate (per site, applied on inject)
INJECT_INS_PROB 0.0            # Insertion rate (per site, applied on inject)
INJECT_DEL_PROB 0.0            # Deletion rate (per site, applied on inject)
SLIP_FILL_MODE 0               # Fill insertions from slip mutations with:
                               # 0 = Duplication
                               # 1 = nop-X
                               # 2 = Random
                               # 3 = Scrambled
                               # 4 = nop-C
SLIP_COPY_MODE 0               # How to handle 'on-copy' slip mutations:
                               # 0 = actual read head slip
                               # 1 = instant large mutation (obeys slip mode)
TRANS_FILL_MODE 0              # Fill insertions from translocation mutations with:
                               # 0 = Duplication
                               # 1 = Scrambled
LGT_FILL_MODE 0                # Fill insertions from lateral gene transfer mutations with:
                               # 0 = Duplication
                               # 1 = scrambled
LGT_SOURCE_REGION 0            # Extract gene for lateral transfer from:
                               # 0 = Local Neighborhood
                               # 1 = Entire Population
PARENT_MUT_PROB 0.0            # Parent substitution rate (per-site, applied on divide)
PARENT_INS_PROB 0.0            # Parent insertion rate (per-site, applied on divide)
PARENT_DEL_PROB 0.0            # Parent deletion rate (per-site, applied on divide)
SPECIAL_MUT_LINE -1            # If this is >= 0, ONLY this line is mutated
META_COPY_MUT 0.0              # Prob. of copy mutation rate changing (per gen)
META_STD_DEV 0.0               # Standard deviation of meta mutation size.
MUT_RATE_SOURCE 1              # 1 = Mutation rates determined by environment.
                               # 2 = Mutation rates inherited from parent.

### REPRODUCTION_GROUP ###
# Birth and Death config options
DIVIDE_FAILURE_RESETS 0   # When Divide fails, organisms are interally reset
BIRTH_METHOD {% if birth_method %} {{ birth_method }} {% else %} 0 {% endif %}            # Which organism should be replaced when a birth occurs?
                          # 0 = Random organism in neighborhood
                          # 1 = Oldest in neighborhood
                          # 2 = Largest Age/Merit in neighborhood
                          # 3 = None (use only empty cells in neighborhood)
                          # 4 = Random from population (Mass Action)
                          # 5 = Oldest in entire population
                          # 6 = Random within deme
                          # 7 = Organism faced by parent
                          # 8 = Next grid cell (id+1)
                          # 9 = Largest energy used in entire population
                          # 10 = Largest energy used in neighborhood
                          # 11 = Local neighborhood dispersal
                          # 12 = Kill offpsring after recording birth stats (for behavioral trials)
                          # 13 = Kill parent and offpsring (for behavioral trials)
PREFER_EMPTY 1            # Overide BIRTH_METHOD to preferentially choose empty cells for offsping?
ALLOW_PARENT 1            # Should parents be considered when deciding where to place offspring?
DISPERSAL_RATE 0.0        # Rate of dispersal under birth method 11
                          # (poisson distributed random connection list hops)
DEATH_PROB 0.0            # Probability of death when dividing.
DEATH_METHOD 2            # When should death by old age occur?
                          # 0 = Never
                          # 1 = When executed AGE_LIMIT (+deviation) total instructions
                          # 2 = When executed genome_length * AGE_LIMIT (+dev) instructions
AGE_LIMIT 20              # See DEATH_METHOD
AGE_DEVIATION 0           # Creates a normal distribution around AGE_LIMIT for time of death
JUV_PERIOD 0              # Number of CPU cycles before newborn orgs can execute various instructions / behaviors
ALLOC_METHOD 0            # When allocating blank tape, how should it be initialized?
                          # 0 = Allocated space is set to default instruction.
                          # 1 = Set to section of dead genome (creates potential for recombination)
                          # 2 = Allocated space is set to random instruction.
DIVIDE_METHOD 1           # 0 = Divide leaves state of mother untouched.
                          # 1 = Divide resets state of mother(effectively creating 2 offspring)
                          # 2 = Divide resets state of current thread only (use with parasites)
EPIGENETIC_METHOD 0       # Inheritance of state information other than genome
                          # 0 = none
                          # 1 = offspring inherits registers and stacks of first thread
                          # 1 = parent maintains registers and stacks of first thread
                          # 
                          # 1 = offspring and parent keep state information
GENERATION_INC_METHOD 1   # 0 = Only increase generation of offspring on divide.
                          # 1 = Increase generation of both parent and offspring
                          #    (suggested with DIVIDE_METHOD 1).
RESET_INPUTS_ON_DIVIDE 0  # Reset environment inputs of parent upon successful divide.
INHERIT_MERIT 1           # Should merit be inhereted from mother parent? (in asexual)
INHERIT_MULTITHREAD 0     # Should offspring of parents with multiple threads be marked multithreaded?

### DIVIDE_GROUP ###
# Divide restrictions and triggers - settings describe conditions for a successful divide
OFFSPRING_SIZE_RANGE 2.0       # Maximal differential between offspring and parent length.
                               # (Checked BEFORE mutations applied on divide.)
MIN_COPIED_LINES 0.5           # Code fraction that must be copied before divide
MIN_EXE_LINES 0.5              # Code fraction that must be executed before divide
MIN_GENOME_SIZE {% if min_genome %} {{ min_genome }} {% else %} 0 {% endif %}              # Minimum number of instructions allowed in a genome. 0 = OFF
MAX_GENOME_SIZE {% if max_genome %} {{ max_genome }} {% else %} 0 {% endif %}              # Maximum number of instructions allowed in a genome. 0 = OFF
MIN_CYCLES 0                   # Min number of CPU cycles (age) required before reproduction.
REQUIRE_ALLOCATE 1             # (Original CPU Only) Require allocate before divide?
REQUIRED_TASK -1               # Task ID required for successful divide
IMMUNITY_TASK -1               # Task providing immunity from the required task
REQUIRED_REACTION -1           # Reaction ID required for successful divide
IMMUNITY_REACTION -1           # Reaction ID that provides immunity for successful divide
REQUIRE_SINGLE_REACTION 0      # If set to 1, at least one reaction is required for a successful divide
REQUIRED_BONUS 0.0             # Required bonus to divide
REQUIRE_EXACT_COPY 0           # Require offspring to be an exact copy (checked before divide mutations)
REQUIRED_RESOURCE -1           # ID of resource required in organism's internal bins for successful
                               #   divide (resource not consumed)
REQUIRED_RESOURCE_LEVEL 0.0    # Level of resource needed for REQUIRED_RESOURCE
REQUIRED_PRED_HABITAT -1       # Required resource habitat type in cell for predators to reproduce
REQUIRED_PRED_HABITAT_VALUE 0  # Level of resource needed for REQUIRED_PRED_HABITAT
REQUIRED_PREY_HABITAT -1       # Required resource habitat type in cell for prey to reproduce
REQUIRED_PREY_HABITAT_VALUE 0  # Level of resource needed for REQUIRED_PREY_HABITAT



### IMPLICIT REPRO ###
IMPLICIT_REPRO_BONUS 0         # Call Inst_Repro to divide upon achieving this bonus. 0 = OFF
IMPLICIT_REPRO_CPU_CYCLES 0    # Call Inst_Repro after this many cpu cycles. 0 = OFF
IMPLICIT_REPRO_TIME 0          # Call Inst_Repro after this time used. 0 = OFF
IMPLICIT_REPRO_END {% if imp_repro %} {{ imp_repro }} {% else %} 1 {% endif %}           # Call Inst_Repro after executing the last instruction in the genome.
IMPLICIT_REPRO_ENERGY 0.0      # Call Inst_Repro if organism accumulates this amount of energy.

### RECOMBINATION_GROUP ###
# Sexual Recombination and Modularity
RECOMBINATION_PROB 1.0  # Probability of recombination in div-sex
MAX_BIRTH_WAIT_TIME -1  # Updates incipiant orgs can wait for crossover (-1 = unlimited)
MODULE_NUM 0            # Number of modules in the genome
CONT_REC_REGS 1         # Are (modular) recombination regions continuous?
CORESPOND_REC_REGS 1    # Are (modular) recombination regions swapped randomly
                        #  or with corresponding positions?
TWO_FOLD_COST_SEX 0     # 0 = Both offspring are born (no two-fold cost)
                        # 1 = only one recombined offspring is born.
SAME_LENGTH_SEX 0       # 0 = Recombine with any genome
                        # 1 = Recombine only w/ same length
ALLOW_MATE_SELECTION 0  # Allow organisms to select mates (requires instruction set support)

### MATING_TYPES_GROUP ###
# Mating Types and Mate Choice
MATING_TYPES 0                      # Turn on separate mating types (i.e., males/females; off by default; requires instruction set support)
LEKKING 0                           # Offspring from males go directly into birth chamber to await female choice (off by default)
MAX_GLOBAL_BIRTH_CHAMBER_SIZE 3600  # Maximum number of waiting that can be stored in the birth chamber in a well-mixed population (3600 by default)
DISABLE_GENOTYPE_CLASSIFICATION 0   # Disable tracking of historical genotypes to conserve memory (off by default)
NOISY_MATE_ASSESSMENT 0             # Is mate assessment perfect (0) or noisy (1) (0 by default)
MATE_ASSESSMENT_CV 0.1              # Coefficient of variation for how noisy mate assessment is (0.1 by default)
FORCED_MATE_PREFERENCE -1           # Force all females to use a specific mate preference; -1 = off (mate preferences can evolve); 0 = all females mate randomly; 1 = all prefer highest display A; 2 = highest display B; 3 = highest merit
MATE_IN_GROUPS 0                    # Require all mating to happen within groups

### PARASITE_GROUP ###
# Parasite config options
INJECT_METHOD 0             # What should happen to a parasite when it gives birth?
                            # 0 = Leave the parasite thread state untouched.
                            # 1 = Resets the state of the calling thread (for SMT parasites, this must be 1)
INFECTION_MECHANISM 1       # 0: Infection always succeeds. 
                            # 1: Infection succeeds if parasite matches at least one host task.
                            # 2: Infection succeeds if parasite does NOT match at least one task.
                            # 3: Parasite tasks must match host tasks exactly (Matching Alleles).
INJECT_QMA_EXPONENT 0.2     # The exponent of the equation proportion_overlap^x that determines the probability of infection succeding given the amount a host and parasite phenotype match.
INJECT_STERILIZES_HOST 0    # Infection causes host steralization
INJECT_IS_VIRULENT 0        # Infection causes host steralization and takes all cpu cycles (setting this to 1 will override inject_virulence)
PARASITE_SKIP_REACTIONS 1   # Parasite tasks do not get processed in the environment (1) or they do trigger reactions (0)
INJECT_SKIP_FIRST_TASK 0    # They cannot match the first task the host is doing to infect
INJECT_DEFAULT_SUCCESS 0.0  # If injection is task specific, with what probability should non-matching parasites infect the host 
PARASITE_VIRULENCE -1       # The probabalistic percentage of cpu cycles allocated to the parasite instead of the host. Ensure INJECT_IS_VIRULENT is set to 0. This only works for single infection at the moment
VIRULENCE_SOURCE 0          # Virulence is set by config (0) or inhereted from parent (1)
VIRULENCE_MUT_RATE 0.1      # The probability that virulence will mutate if it is inhereted from the parent (VIRULENCE_SOURCE = 1)
VIRULENCE_SD 0.1            # New Virulence will be drawn from a normal distribution centered on the parental virulence, with this standard deviation
PARASITE_MEM_SPACES 1       # Parasites get their own memory spaces
PARASITE_NO_COPY_MUT 0      # Parasites do not get copy mutation rates

### ARCHETECTURE_GROUP ###
# Details on how CPU should work
IO_EXPIRE 1          # Is the expiration functionality of '-expire' I/O instructions enabled?
POISON_PENALTY 0.01  # Metabolic rate penalty applied when the 'poison' instruction is executed.

### MP_GROUP ###
# Config options for multiple, distributed populations
ENABLE_MP 0            # Enable multi-process Avida; 0=disabled (default),
                       # 1=enabled.
MP_SCHEDULING_STYLE 0  # Style of scheduling:
                       # 0=non-MP aware (default)
                       # 1=MP aware, integrated across worlds.

### DEME_GROUP ###
# Demes and Germlines
NUM_DEMES 1                             # Number of independent groups in the population
DEMES_COMPETITION_STYLE 0               # How should demes compete?
                                        # 0=Fitness proportional selection
                                        # 1=Tournament selection
DEMES_TOURNAMENT_SIZE 0                 # Number of demes that participate in a tournament
DEMES_OVERRIDE_FITNESS 0                # Should the calculated fitness is used?
                                        # 0=yes (default)
                                        # 1=no (all fitnesses=1)
DEMES_USE_GERMLINE 0                    # Should demes use a distinct germline? 0: No, 1: Traditional germ lines, 2: Genotype tracking, 3: Organism flagging germline
DEMES_PREVENT_STERILE 0                 # Prevent sterile demes from replicating?
DEMES_RESET_RESOURCES 0                 # Reset resources in demes on replication?
                                        # 0 = reset both demes 
                                        # 1 = reset target deme 
                                        # 2 = deme resources remain unchanged
DEMES_REPLICATE_SIZE 1                  # Number of identical organisms to create or copy from the
                                        # source deme to the target deme
LOG_DEMES_REPLICATE 0                   # Log deme replications?
DEMES_REPLICATE_LOG_START 0             # Update at which to start logging deme replications
DEMES_PROB_ORG_TRANSFER 0.0             # Probablity of an organism being transferred from the
                                        # source deme to the target deme
DEMES_ORGANISM_SELECTION 0              # How should organisms be selected for transfer from
                                        # source to target during deme replication?
                                        # 0 = random with replacement
                                        # 1 = sequential
                                        # 2-6 = created, but not sure what they do
                                        # 7 = organism(s) flagged germline
                                        # 8=one of the organisms flagged as part of the germline
DEMES_ORGANISM_PLACEMENT 0              # How should organisms be placed during deme replication.
                                        # 0 = cell-array middle
                                        # 1 = deme center
                                        # 2 = random placement
                                        # 3 = sequential
DEMES_ORGANISM_FACING 0                 # Which direction should organisms face after deme replication.
                                        # 0 = unchanged
                                        # 1 = northwest.
                                        # 2 = random.
DEMES_MAX_AGE 500                       # The maximum age of a deme (in updates) to be
                                        # used for age-based replication
DEMES_MAX_BIRTHS 100                    # Max number of births that can occur within a deme;
                                        # used with birth-count replication
DEMES_MIM_EVENTS_KILLED_RATIO 0.7       # Minimum ratio of events killed required for event period to be a success.
DEMES_MIM_SUCCESSFUL_EVENT_PERIODS 1    # Minimum number of consecutive event periods that must be a success.
GERMLINE_COPY_MUT 0.0075                # Prob. of copy mutations during germline replication
GERMLINE_INS_MUT 0.05                   # Prob. of insertion mutations during germline replication
GERMLINE_DEL_MUT 0.05                   # Prob. of deletion mutations during germline replication
DEMES_REPLICATE_CPU_CYCLES 0.0          # Replicate a deme immediately after it has used this many
                                        # cpu cycles per org in deme (0 = OFF).
DEMES_REPLICATE_TIME 0.0                # Number of CPU cycles used by a deme to trigger its replication
                                        # (normalized by number of orgs in deme and organism merit; 0 = OFF).
DEMES_REPLICATE_BIRTHS 0                # Number of offspring produced by a deme to trigger its replication (0 = OFF).
DEMES_REPLICATE_ORGS 0                  # Number of organisms in a deme to trigger its replication (0 = OFF).
DEMES_REPLICATION_ONLY_RESETS 0         # Kin selection mode.  On replication:
                                        # 0 = Nothing extra
                                        # 1 = reset deme resources
                                        # 2 = reset resources and re-inject organisms
DEMES_MIGRATION_RATE 0.0                # Probability of an offspring being born in a different deme.
DEMES_PARASITE_MIGRATION_RATE 0.0       # Probability of a parasite migrating to a different deme
DEMES_MIGRATION_METHOD 0                # Which demes can an offspring land in when it migrates?
                                        # 0 = Any other deme
                                        # 1 = Eight neighboring demes
                                        # 2 = Two adjacent demes in list
                                        # 3 = Proportional based on the number of points
                                        # 4 = Use the weight matrix specified in MIGRATION_FILE
DEMES_NUM_X 0                           # Simulated number of demes in X dimension. Used only for migration. 
DEMES_SEED_METHOD 0                     # Deme seeding method.
                                        # 0 = Maintain old consistency
                                        # 1 = New method using genotypes
DEMES_DIVIDE_METHOD 0                   # Deme divide method. Only works with DEMES_SEED_METHOD 1
                                        # 0 = Replace and target demes
                                        # 1 = Replace target deme, reset source deme to founders
                                        # 2 = Replace target deme, leave source deme unchanged
                                        # 3 = Replace the target deme, and reset the number of resources consumed by the source deme.
                                        # 4 = Replace the target deme,  reset the number of resources consumed by the source deme, and kill the germ line organisms of the source deme
DEMES_DEFAULT_GERMLINE_PROPENSITY 0.0   # Default germline propensity of organisms in deme.
                                        # For use with DEMES_DIVIDE_METHOD 2.
DEMES_FOUNDER_GERMLINE_PROPENSITY -1.0  # Default germline propensity of founder organisms in deme.
                                        # For use with DEMES_DIVIDE_METHOD 2.
                                        #  <0 = OFF
DEMES_PREFER_EMPTY 0                    # Give empty demes preference as targets of deme replication?
DEMES_PROTECTION_POINTS 0               # The number of points a deme receives for each suicide.
MIGRATION_RATE 0.0                      # Uniform probability of offspring migrating to a new deme.
DEMES_TRACK_SHANNON_INFO 0              # Enable shannon mutual information tracking for demes.
DEMES_MUT_ORGS_ON_REPLICATION 0         # Mutate orgs using germline mutation rates when they are copied to a new deme (using DEMES_SEED_METHOD 1): 0=OFF, 1=ON
DEMES_ORGS_START_IN_GERM 0              # Are orgs considered part of the germline at start?

### REVERSION_GROUP ###
# Mutation Reversion
# Most of these slow down avida a lot, and should be set to 0.0 normally.
REVERT_FATAL 0.0           # Prob of lethal mutations being reverted on birth
REVERT_DETRIMENTAL 0.0     # Prob of harmful (but non-lethal) mutations reverting on birth
REVERT_NEUTRAL 0.0         # Prob of neutral mutations being reverted on birth
REVERT_BENEFICIAL 0.0      # Prob of beneficial mutations being reverted on birth
REVERT_TASKLOSS 0.0        # Prob of mutations that cause task loss without any tasks gained being reverted on birth
REVERT_EQUALS 0.0          # Prob of mutations which grant EQU being reverted on birth
STERILIZE_FATAL 0.0        # Prob of lethal mutations steralizing an offspring (typically no effect!)
STERILIZE_DETRIMENTAL 0.0  # Prob of harmful (but non-lethal) mutations sterilizing an offspring
STERILIZE_NEUTRAL 0.0      # Prob of neutral mutations sterilizing an offspring
STERILIZE_BENEFICIAL 0.0   # Prob of beneficial mutations sterilizing an offspring
STERILIZE_TASKLOSS 0.0     # Prob of mutations causing task loss without task gain sterilizing an offspring
STERILIZE_UNSTABLE 0       # Should genotypes that cannot replicate perfectly not be allowed to replicate?
NEUTRAL_MAX 0.0            # Percent benifical change from parent fitness to be considered neutral.
NEUTRAL_MIN 0.0            # Percent deleterious change from parent fitness to be considered neutral.

### TIME_GROUP ###
# Time Slicing
AVE_TIME_SLICE 30            # Average number of CPU-cycles per org per update
SLICING_METHOD 1             # 0 = CONSTANT: all organisms receive equal number of CPU cycles
                             # 1 = PROBABILISTIC: CPU cycles distributed randomly, proportional to merit.
                             # 2 = INTEGRATED: CPU cycles given out deterministicly, proportional to merit
                             # 3 = DEME_PROBABALISTIC: Demes receive fixed number of CPU cycles, awarded probabalistically to members
                             # 4 = CROSS_DEME_PROBABALISTIC: Demes receive CPU cycles proportional to living population size, awarded probabalistically to members
                             # 5 = CONSTANT BURST: all organisms receive equal number of CPU cycles, in SLICING_BURST_SIZE chunks
SLICING_BURST_SIZE 1         # Sets the scheduler burst size for SLICING_METHOD 5.
BASE_MERIT_METHOD {% if merit_method %} {{ merit_method }} {% else %} 4 {% endif %}          # How should merit be initialized?
                             # 0 = Constant (merit independent of size)
                             # 1 = Merit proportional to copied size
                             # 2 = Merit prop. to executed size
                             # 3 = Merit prop. to full size
                             # 4 = Merit prop. to min of executed or copied size
                             # 5 = Merit prop. to sqrt of the minimum size
                             # 6 = Merit prop. to num times MERIT_BONUS_INST is in genome.
BASE_CONST_MERIT 100         # Base merit valse for BASE_MERIT_METHOD 0
MERIT_BONUS_INST 0           # Instruction ID to count for BASE_MERIT_METHOD 6
MERIT_BONUS_EFFECT 0         # Amount of merit earn per instruction for BASE_MERIT_METHOD 6 (-1 = penalty, 0 = no effect)
FITNESS_VALLEY 0             # in BASE_MERIT_METHOD 6, this creates valleys from
                             # FITNESS_VALLEY_START to FITNESS_VALLEY_STOP
                             # (0 = off, 1 = on)
FITNESS_VALLEY_START 0       # if FITNESS_VALLEY = 1, orgs with num_key_instructions
                             # from FITNESS_VALLEY_START to FITNESS_VALLEY_STOP
                             # get fitness 1 (lowest)
FITNESS_VALLEY_STOP 0        # if FITNESS_VALLEY = 1, orgs with num_key_instructions
                             # from FITNESS_VALLEY_START to FITNESS_VALLEY_STOP
                             # get fitness 1 (lowest)
DEFAULT_BONUS 1.0            # Initial bonus before any tasks
MERIT_DEFAULT_BONUS 0        # Instead of inheriting bonus from parent, use this value instead (0 = off)
MERIT_INC_APPLY_IMMEDIATE 0  # Should merit increases (above current) be applied immediately, or delayed until divide?
TASK_REFRACTORY_PERIOD 0.0   # Number of updates after taske until regain full value
FITNESS_METHOD 0             # 0 = default, 1 = sigmoidal, 
FITNESS_COEFF_1 1.0          # 1st FITNESS_METHOD parameter
FITNESS_COEFF_2 1.0          # 2nd FITNESS_METHOD parameter
MAX_CPU_THREADS 1            # Maximum number of Threads a CPU can spawn
THREAD_SLICING_METHOD 0      # Formula for allocating CPU cycles across threads in an organism
                             #   (num_threads-1) * THREAD_SLICING_METHOD + 1
                             # 0 = One thread executed per time slice.
                             # 1 = All threads executed each time slice.
NO_CPU_CYCLE_TIME 0          # Don't count each CPU cycle as part of gestation time
MAX_LABEL_EXE_SIZE 1         # Max nops marked as executed when labels are used
PRECALC_PHENOTYPE 0          # 0 = Disabled
                             #  1 = Assign precalculated merit at birth (unlimited resources only)
                             #  2 = Assign precalculated gestation time
                             #  3 = Assign precalculated merit AND gestation time.
                             #  4 = Assign last instruction counts 
                             #  5 = Assign last instruction counts and merit
                             #  6 = Assign last instruction counts and gestation time 
                             #  7 = Assign everything currently supported
                             # Fitness will be evaluated for organism based on these settings.
FASTFORWARD_UPDATES 0        # Fast-forward if the average generation has not changed in this many updates. (0 = off)
FASTFORWARD_NUM_ORGS 0       # Fast-forward if population is equal to this
GENOTYPE_PHENPLAST_CALC 100  # Number of times to test a genotype's
                             # plasticity during runtime.

### ALTRUISM_GROUP ###
# Altrusim
MERIT_GIVEN 0.0             # Fraction of merit donated with 'donate' command
MERIT_RECEIVED 0.0          # Multiplier of merit given with 'donate' command
MAX_DONATE_KIN_DIST -1      # Limit on distance of relation for donate; -1=no max
MAX_DONATE_EDIT_DIST -1     # Limit on genetic (edit) distance for donate; -1=no max
MIN_GB_DONATE_THRESHOLD -1  # threshold green beard donates only to orgs above this
                            # donation attempt threshold; -1=no thresh
DONATE_THRESH_QUANTA 10     # The size of steps between quanta donate thresholds
MAX_DONATES 1000000         # Limit on number of donates organisms are allowed.
TRACK_DONATES 0             # Track execution circumstances around donate-specific.

### KABOOM_GROUP ###
# Kaboom
KABOOM_PROB -1     # The probability (in decimal) that an explosion will occur when the instruction is encountered. -1 is default probability and allows the organism to change the probability.
KABOOM_RADIUS 2    # Radius of all explosions (kaboom and kaboom5)
KABOOM_HAMMING 0   # Hamming distance of kaboom's threshold, set to -1 to have adjustable, default is 0 for cheaters.
KABOOM5_HAMMING 5  # Hamming distance of kaboom5's threshold, set to -1 to have adjustable, default is 5 for altruists.
NO_MUT_INSTS       # A list of the instruction symbols that should not be able to be mutated out.

### GENEOLOGY_GROUP ###
# Geneology
THRESHOLD {% if geneology_thresh %} {{ geneology_thresh }} {% else %} 3 {% endif %}           # Number of organisms in a genotype needed for it
                      #   to be considered viable.
TEST_CPU_TIME_MOD 20  # Time allocated in test CPUs (multiple of length)

### LOG_GROUP ###
# Log Files
LOG_GENOTYPES {% if log_genotypes %} {{ log_genotypes }} {% else %} 1 {% endif %}            # 0 = off, 1 = print ALL, 2 = print threshold ONLY.
LOG_THRESHOLD 0            # 0/1 (off/on) toggle to print file.
LOG_LINEAGES {% if log_lineages %} {{ log_lineages }} {% else %} 1 {% endif %}             # Track lineages over time?
                           # WARNING: Can slow Avida a lot!
LINEAGE_CREATION_METHOD {% if lineage_method %} {{ lineage_method }} {% else %} 7 {% endif %}  # Requires LOG_LINEAGES = 1
                           # 0 = Manual creation (on inject)
                           # 1 = when a child's (potential) fitness is higher than that of its parent.
                           # 2 = when a child's (potential) fitness is higher than max in population.
                           # 3 = when a child's (potential) fitness is higher than max in dom. lineage
                           #   *and* the child is in the dominant lineage, or (2)
                           # 4 = when a child's (potential) fitness is higher than max in dom. lineage
                           #   (and that of its own lineage)
                           # 5 = same as child's (potential) fitness is higher than that of the
                           #   currently dominant organism, and also than that of any organism
                           #       currently in the same lineage.
                           # 6 = when a child's (potential) fitness is higher than any organism
                           #   currently in the same lineage.
                           # 7 = when a child's (potential) fitness is higher than that of any
                           #   organism in its line of descent
TRACE_EXECUTION 0          # Trace the execution of all organisms in the population (WARNING: SLOW!)

### ORGANISM_NETWORK_GROUP ###
# Organism Network Communication
NET_ENABLED 0       # Enable Network Communication Support
NET_DROP_PROB 0.0   # Message drop rate
NET_MUT_PROB 0.0    # Message corruption probability
NET_MUT_TYPE 0      # Type of message corruption.  0 = Random Single Bit, 1 = Always Flip Last
NET_STYLE 0         # Communication Style.  0 = Random Next, 1 = Receiver Facing
NET_LOG_MESSAGES 0  # Whether all messages are logged; 0=false (default), 1=true.

### ORGANISM_MESSAGING_GROUP ###
# Organism Message-Based Communication
MESSAGE_SEND_BUFFER_SIZE 1      # Size of message send buffer (stores messages that were sent)
                                # TASKS NOT CHECKED ON 0!
                                # -1=inf, default=1.
MESSAGE_RECV_BUFFER_SIZE 8      # Size of message receive buffer (stores messages that are received); -1=inf, default=8.
MESSAGE_RECV_BUFFER_BEHAVIOR 0  # Behavior of message receive buffer; 0=drop oldest (default), 1=drop incoming
ACTIVE_MESSAGES_ENABLED 0       # Enable active messages. 
                                # 0 = off
                                # 2 = message creates parallel thread
CHECK_TASK_ON_SEND 1            # 0: Don't check tasks on send, 1: Check tasks on send (default)
NEURAL_NETWORKING 0             # Turns neural networking system on/off. 
                                # Requires USE_AVATARS be turned on.
SELF_COMMUNICATION 0            # Allows organisms to create self communication loops. 
                                # An organism's input avatars can receive messages from it's own output avatars.

### BUY_SELL_GROUP ###
# Buying and Selling Parameters
SAVE_RECEIVED 0  # Enable storage of all inputs bought from other orgs
BUY_PRICE 0      # price offered by organisms attempting to buy
SELL_PRICE 0     # price offered by organisms attempting to sell

### HOARD_RESOURCE_GROUP ###
# Resource Hoarding Parameters
USE_RESOURCE_BINS 0             # Enable resource bin use.  This serves as a guard on most resource hoarding code.
ABSORB_RESOURCE_FRACTION .0025  # Fraction of available environmental resource an organism absorbs.
MULTI_ABSORB_TYPE 0             # What to do if a collect instruction is called on a range of resources.
                                #  0 = absorb a random resource in the range
                                #  1 = absorb the first resource in the range
                                #  2 = absorb the last resource in the range
                                #  3 = absorb ABSORB_RESOURCE_FRACTION / (# of resources in range) of each resource in the range
MAX_TOTAL_STORED -1             # Maximum total amount of all resources an organism can store.
                                #  <0 = no maximum
USE_STORED_FRACTION 1.0         # The fraction of stored resource to use.
ENV_FRACTION_THRESHOLD 1.0      # The fraction of available environmental resource to compare available stored resource to when deciding whether to use stored resource.
RETURN_STORED_ON_DEATH 1        # Return an organism's stored resources to the world when it dies?
SPLIT_ON_DIVIDE 1               # Split mother cell's resources between two daughter cells on division?
COLLECT_SPECIFIC_RESOURCE 0     # Resource to be collected by the "collect-specific" instruction.
RESOURCE_GIVEN_ON_INJECT 0.0    # Units of collect-specific resources given on inject.
RESOURCE_GIVEN_AT_BIRTH 0.0     # Units of collect-specific resources given to offspring upon birth (will be added to SPLIT_ON_DIVIDE amount for collect-specific resource if both enabled.
COLLECT_PROB_DIVISOR 1          # Divisor for probabilistic collect instructions.

### ANALYZE_GROUP ###
# Analysis Settings
MAX_CONCURRENCY -1     # Maximum number of analyze threads, -1 == use all available.
INJECT_RESETS_TASKS 0  # Executing INJECT (semi-succesfully) will trigger last_task_count to be writen from current_task_count
ANALYZE_OPTION_1       # String variable accessible from analysis scripts
ANALYZE_OPTION_2       # String variable accessible from analysis scripts

### ENERGY_GROUP ###
# Energy Settings
ENERGY_ENABLED 0                               # Enable Energy Model. 0/1 (off/on)
ENERGY_GIVEN_ON_INJECT 0.0                     # Energy given to organism upon injection.
ENERGY_GIVEN_AT_BIRTH 0.0                      # Energy given to offspring upon birth.
FRAC_PARENT_ENERGY_GIVEN_TO_ORG_AT_BIRTH 0.5   # Fraction of parent's energy given to offspring organism.
FRAC_PARENT_ENERGY_GIVEN_TO_DEME_AT_BIRTH 0.5  # Fraction of parent's energy given to offspring deme.
FRAC_ENERGY_DECAY_AT_ORG_BIRTH 0.0             # Fraction of energy lost due to decay during organism reproduction.
FRAC_ENERGY_DECAY_AT_DEME_BIRTH 0.0            # Fraction of energy lost due to decay during deme reproduction.
NUM_CYCLES_EXC_BEFORE_0_ENERGY 0               # Number of virtual CPU cycles executed before energy is exhausted.
ENERGY_CAP -1.0                                # Maximum amount of energy that can be stored in an organism.  -1 = no max
APPLY_ENERGY_METHOD 0                          # When should rewarded energy be applied to current energy?
                                               # 0 = on divide
                                               # 1 = on completion of task
                                               # 2 = on sleep
FIX_METABOLIC_RATE -1.0                        # Fix organism metobolic rate to value.  This value is static.  Feature disabled by default (value == -1)
FRAC_ENERGY_TRANSFER 0.0                       # Fraction of replaced organism's energy take by new resident
LOG_SLEEP_TIMES 0                              # Log sleep start and end times. 0/1 (off/on)
                                               # WARNING: may use lots of memory.
FRAC_ENERGY_RELINQUISH 1.0                     # Fraction of organisms energy to relinquish
ENERGY_PASSED_ON_DEME_REPLICATION_METHOD 0     # Who get energy passed from a parent deme
                                               # 0 = Energy divided among organisms injected to offspring deme
                                               # 1 = Energy divided among cells in offspring deme
INHERIT_EXE_RATE 0                             # Inherit energy rate from parent? 0=no  1=yes
ATTACK_DECAY_RATE 0.0                          # Percent of cell's energy decayed by attack
ENERGY_THRESH_LOW .33                          # Threshold percent below which energy level is considered low.  Requires ENERGY_CAP.
ENERGY_THRESH_HIGH .75                         # Threshold percent above which energy level is considered high.  Requires ENERGY_CAP.
ENERGY_COMPARISON_EPSILON 0.0                  # Percent difference (relative to executing organism) required in energy level comparisons
ENERGY_REQUEST_RADIUS 1                        # Radius of broadcast energy request messages.

### ENERGY_SHARING_GROUP ###
# Energy Sharing Settings
ENERGY_SHARING_METHOD 0            # Method for sharing energy.  0=receiver must actively receive/request, 1=energy pushed on receiver
ENERGY_SHARING_PCT 0.0             # Percent of energy to share
ENERGY_SHARING_INCREMENT 0.01      # Amount to change percent energy shared
RESOURCE_SHARING_LOSS 0.0          # Fraction of shared resource lost in transfer
ENERGY_SHARING_UPDATE_METABOLIC 0  # 0/1 (off/on) - Whether to update an organism's metabolic rate on donate or reception/application of energy
LOG_ENERGY_SHARING 0               # Whether or not to log energy shares.  0/1 (off/on)

### SECOND_PASS_GROUP ###
# Tracking metrics known after the running experiment previously
TRACK_CCLADES 0                    # Enable tracking of coalescence clades
TRACK_CCLADES_IDS coalescence.ids  # File storing coalescence IDs

### GX_GROUP ###
# Gene Expression CPU Settings
MAX_PROGRAMIDS 16                # Maximum number of programids an organism can create.
MAX_PROGRAMID_AGE 2000           # Max number of CPU cycles a programid executes before it is removed.
IMPLICIT_GENE_EXPRESSION 0       # Create executable programids from the genome without explicit allocation and copying?
IMPLICIT_BG_PROMOTER_RATE 0.0    # Relative rate of non-promoter sites creating programids.
IMPLICIT_TURNOVER_RATE 0.0       # Number of programids recycled per CPU cycle. 0 = OFF
IMPLICIT_MAX_PROGRAMID_LENGTH 0  # Creation of an executable programid terminates after this many instructions. 0 = disabled

### PROMOTER_GROUP ###
# Promoters
PROMOTERS_ENABLED 0             # Use the promoter/terminator execution scheme.
                                # Certain instructions must also be included.
PROMOTER_INST_MAX 0             # Maximum number of instructions to execute before terminating. 0 = off
PROMOTER_PROCESSIVITY 1.0       # Chance of not terminating after each cpu cycle.
PROMOTER_PROCESSIVITY_INST 1.0  # Chance of not terminating after each instruction.
PROMOTER_TO_REGISTER 0          # Place a promoter's base bit code in register BX when starting execution from it?
TERMINATION_RESETS 0            # Does termination reset the thread's state?
NO_ACTIVE_PROMOTER_EFFECT 0     # What happens when there are no active promoters?
                                # 0 = Start execution at the beginning of the genome.
                                # 1 = Kill the organism.
                                # 2 = Stop the organism from executing any further instructions.
PROMOTER_CODE_SIZE 24           # Size of a promoter code in bits. (Maximum value is 32)
PROMOTER_EXE_LENGTH 3           # Length of promoter windows used to determine execution.
PROMOTER_EXE_THRESHOLD 2        # Minimum number of bits that must be set in a promoter window to allow execution.
INST_CODE_LENGTH 3              # Instruction binary code length (number of bits)
INST_CODE_DEFAULT_TYPE 0        # Default value of instruction binary code value.
                                # 0 = All zeros
                                # 1 = Based off the instruction number
CONSTITUTIVE_REGULATION 0       # Sense a new regulation value before each CPU cycle?

### COLORS_GROUP ###
# Output colors for when data files are printed in HTML mode.
# There are two sets of these; the first are for lineages,
# and the second are for mutation tests.
COLOR_DIFF CCCCFF        # Color to flag stat that has changed since parent.
COLOR_SAME FFFFFF        # Color to flag stat that has NOT changed since parent.
COLOR_NEG2 FF0000        # Color to flag stat that is significantly worse than parent.
COLOR_NEG1 FFCCCC        # Color to flag stat that is minorly worse than parent.
COLOR_POS1 CCFFCC        # Color to flag stat that is minorly better than parent.
COLOR_POS2 00FF00        # Color to flag stat that is significantly better than parent.
COLOR_MUT_POS 00FF00     # Color to flag stat that has changed since parent.
COLOR_MUT_NEUT FFFFFF    # Color to flag stat that has changed since parent.
COLOR_MUT_NEG FFFF00     # Color to flag stat that has changed since parent.
COLOR_MUT_LETHAL FF0000  # Color to flag stat that has changed since parent.

### MOVEMENT_GROUP ###
# Movement Features Settings
MOVEMENT_COLLISIONS_LETHAL 0          # Are collisions during movement lethal (not applied to avatars)? (0=no, use swap; 1=yes, use collision selection type; 2=no, but movement fails)
MOVEMENT_COLLISIONS_SELECTION_TYPE 0  # 0 = 50% chance
                                      # 1 = binned vitality based
VITALITY_BIN_EXTREMES 1.0             # vitality multiplier for extremes (> 1 stddev from the mean population age)
VITALITY_BIN_CENTER 10.0              # vitality multiplier for center bin (with 1 stddev of the mean population age)
DEADLY_BOUNDARIES 0                   # Are bounded grid border cell deadly? If == 1, orgs stepping onto boundary cells will disappear into oblivion (aka die)
STEP_COUNTING_ERROR 0                 # % chance a step is not counted as part of easterly/northerly travel.
USE_AVATARS 0                         # Set orgs to move & navigate in solo avatar worlds(1=yes, 2=yes, with org interactions).
AVATAR_BIRTH 0                        # 0 Same as parent 
                                      #  1 Random 
                                      #  2 Cell faced by parent avatar 
                                      #  3 next grid cell
LOOK_DIST -1                          # -1: use limits set inside look instructions 
                                      #  >-1: limit sight distance of look instructions to this number of cells
LOOK_DISABLE 0                        # 0: none 
                                      #  1: input habitat register 
                                      #  2: input sight dist sought 
                                      #  3: input type of search (e.g. closest vs count vs total) 
                                      #  4: input resource/org id sought 
                                      #  5: output habitat used 
                                      #  6: output distance used
                                      #  7: output search type used
                                      #  8: output resource/org id used 
                                      #  9: output count (edible)
                                      #  10: outptu amount/value seen
                                      #  11: output id seen 
                                      #  12: output org forage target seen
LOOK_DISABLE_TYPE 0                   # 0: predators 
                                      #  1: prey 
                                      #  2: both predators and prey
USE_DISPLAY 0                         # If 1, org display data is always 'on' (visible). If 2, org display is on and sensor does not set potential data.

### PHEROMONE_GROUP ###
# Pheromone Settings
PHEROMONE_ENABLED 0        # Enable pheromone usage. 0/1 (off/on)
PHEROMONE_AMOUNT 1.0       # Amount of pheromone to add per drop
PHEROMONE_DROP_MODE 0      # Where to drop pheromone
                           # 0 = Half amount at src, half at dest
                           # 1 = All at source
                           # 2 = All at dest
EXPLOIT_EXPLORE_PROB 0.00  # Probability of random exploration
                           # instead of pheromone trail following
LOG_PHEROMONE 0            # Log pheromone drops.  0/1 (off/on)
PHEROMONE_LOG_START 0      # Update at which to start logging pheromone drops
EXPLOIT_LOG_START 0        # Update at which to start logging exploit moves
EXPLORE_LOG_START 0        # Update at which to start logging explore moves
MOVETARGET_LOG_START 0     # Update at which to start logging movetarget moves
LOG_INJECT 0               # Log injection of organisms.  0/1 (off/on)
INJECT_LOG_START 0         # Update at which to start logging injection of
                           # organisms

### SYNCHRONIZATION_GROUP ###
# Synchronization settings
SYNC_FITNESS_WINDOW 100     # Number of updates over which to calculate fitness (default=100).
SYNC_FLASH_LOSSRATE 0.0     # P() to lose a flash send (0.0==off).
SYNC_TEST_FLASH_ARRIVAL -1  # CPU cycle at which an organism will receive a flash (off=-1, default=-1, analyze mode only.)

### CONSENSUS_GROUP ###
# Consensus settings
CONSENSUS_HOLD_TIME 1  # Number of updates that consensus must be held for.

### REPUTATION_GROUP ###
# Reputation Settings
RAW_MATERIAL_AMOUNT 100          # Number of raw materials an organism starts with
AUTO_REPUTATION 0                # Is an organism's reputation automatically computed based on its donations
                                 # 0=no
                                 # 1=increment for each donation + standing
                                 # 2=+1 for donations given -1 for donations received
                                 # 3=1 for donors -1 for recivers who have not donated
                                 # 4=+1 for donors
                                 # 5=+1 for donors during task check
ALT_BENEFIT 1.00                 # Number multiplied by the number of raw materials received from another organism to compute reward
ALT_COST 1.00                    # Number multiplied by the number of your raw materials
ROTATE_ON_DONATE 0               # Rotate an organism to face its donor 0/1 (off/on)
REPUTATION_REWARD 0              # Reward an organism for having a good reputation
DONATION_FAILURE_PERCENT 0       # Percentage of times that a donation fails
RANDOMIZE_RAW_MATERIAL_AMOUNT 0  # Should all the organisms receive the same amount 0/1 (off/on)
DONATION_RESTRICTIONS 0          # 0=none
                                 # 1=inter-species only
                                 # 2=different tag only
INHERIT_REPUTATION 0             # 0=reputations are not inherited
                                 # 1=reputations are inherited
                                 # 2=tags are inherited
SPECIALISTS 0                    # 0=generalists allowed
                                 # 1=only specialists
STRING_AMOUNT_CAP -1             # -1=no cap on string amounts
                                 # #=CAP
MATCH_ALREADY_PRODUCED 0         # 0=off
                                 # 1=on

### GROUP_FORMATION_GROUP ###
# Group Formation Settings
USE_FORM_GROUPS 0       # Enable organisms to form groups. 0=off,
                        #  1=on no restrict,
                        #  2=on restrict to defined
DEFAULT_GROUP -1        # Default group to assign to organisms not asserting a group membership (-1 indicates disabled)
INHERIT_OPINION 1       # Should offspring inherit the parent's opinion? 0: No... reset on divide, etc. 1: Yes
OPINION_BUFFER_SIZE 1   # Size of the opinion buffer (stores opinions set over the organism's lifetime); -1=inf, default=1, cannot be 0.
JOIN_GROUP_FAILURE 0    # Percent chance for failing to switch groups. If negative, is % chance of death.
TOLERANCE_WINDOW 0      # Window of previous updates used to evaluate org's tolerance levels
                        # (0 indicates tolarance disabled, values <0 indicate % chance random migration for offspring)
MAX_TOLERANCE 1         # Maximum tolerance level
TOLERANCE_VARIATIONS 0  # 0=all tolerance active,
                        # 1=only immigration tolerance active,
                        # 2=immigrants + sex
TRACK_TOLERANCE 0       # Turn on/off detailed recording of tolerance change circumstances (Warning: can be slow)
PRED_PREY_SWITCH -1     #  -2: no predators, but track prey stats 
                        #  -1: no predators in experiment 
                        #  0: don't allow a predator to switch to being a prey (prey to pred always allowed) 
                        #  1: allow predators to switch to being prey 
                        #  2: don't allow a predator to switch to being a prey & don't allow prey to switch via set-forage-target (via attack allowed) )
PRED_EFFICIENCY 1.0     # Multiply the current bonus, merit, and resource bin amounts of the consumed prey by this value
                        #  and add to current predator values (for bonus, merit, and bin consumption instructions).
PRED_ODDS 1.0           # Probability of success for predator 'attack' instructions.
PRED_INJURY 0.0         # If an attack fails, target's bonus, merit, and internal resources are reduced by this fraction.
MIN_PREY 0              # Attacks fail if number of prey falls below this number (0 = off).
MARKING_EXPIRE_DATE -1  #  Number of updates markings in cells will remain effective on territory move.

### DEME_NETWORK_GROUP ###
# Deme network settings
DEME_NETWORK_TYPE 0                    # 0=topology, structure of network determines fitness.
DEME_NETWORK_REQUIRES_CONNECTEDNESS 1  # Whether the deme's network must be connected before an actual fitness is calculated.
DEME_NETWORK_TOPOLOGY_FITNESS 0        # Network measure used to determine fitness; see cDemeTopologyNetwork.h.
DEME_NETWORK_LINK_DECAY 0              # Number of updates after which a link decays; 0=no decay (default).
DEME_NETWORK_REMOVE_NODE_ON_DEATH 0    # Whether death of an organism in
                                       # the deme removes its links;
                                       # 0=no (default);
                                       # 1=yes.

### HGT_GROUP ###
# Horizontal gene transfer settings
ENABLE_HGT 0                    # Whether HGT is enabled; 0=false (default),
                                # 1=true.
HGT_SOURCE 0                    # Source of HGT fragments; 0=dead organisms (default),
                                # 1=parent.
HGT_FRAGMENT_SELECTION 0        # Method used to select fragments for HGT mutation; 0=random (default),
                                # 1=trimmed selection
                                # 2=random placement.
HGT_FRAGMENT_SIZE_MEAN 10       # Mean size of fragments (default=10).
HGT_FRAGMENT_SIZE_VARIANCE 2    # Variance of fragments (default=2).
HGT_MAX_FRAGMENTS_PER_CELL 100  # Max. allowed number of fragments per cell (default=100).
HGT_DIFFUSION_METHOD 0          # Method to use for diffusion of genome fragments; 0=none (default).
HGT_COMPETENCE_P 0.0            # Probability that an HGT 'natural competence' mutation will occur on divide (default=0.0).
HGT_INSERTION_MUT_P 0.0         # Probability that an HGT mutation will result in an insertion (default=0.0).
HGT_CONJUGATION_METHOD 0        # Method used to select the receiver and/or donor of an HGT conjugation;
                                # 0=random from neighborhood (default);
                                # 1=faced.
HGT_CONJUGATION_P 0.0           # Probability that an HGT conjugation mutation will occur on divide (default=0.0).
HGT_FRAGMENT_XFORM 0            # Transformation to apply to each fragment prior to incorporation into offspring's genome; 0=none (default),
                                # 1=random shuffle,
                                # 2=replace with random instructions.

### INST_RES_GROUP ###
# Resource-Dependent Instructions Settings
INST_RES            # Resource upon which the execution of certain instruction depends
INST_RES_FLOOR 0.0  # Assumed lower level of resource in environment.  Used for probability dist.
INST_RES_CEIL 0.0   # Assumed upper level of resource in environment.  Used for probability dist.

### ALARM_GROUP ###
# Alarm Settings
BCAST_HOPS 1  # Number of hops to broadcast an alarm
ALARM_SELF 0  # Does sending an alarm move sender IP to alarm label?
              # 0=no
              # 1=yes

### DIVISION_OF_LABOR_GROUP ###
# Division of Labor settings
AGE_POLY_TRACKING 0         # Print data for an age-task histogram
REACTION_THRESH 0           # The number of times the deme must perform each reaction in order to replicate
TASK_SWITCH_PENALTY 0       # Cost of task switching in cycles
TASK_SWITCH_PENALTY_TYPE 0  # Type of task switch cost: (0) none (1) learning, (2) retooling or context, (3) centrifuge
RES_FOR_DEME_REP 0          # The amount of resources that must be consumed prior to automatic deme replication
LEARNING_COUNT 0            # The number of times a task must be performed to avoid efficiency penalties

### DEPRECATED_GROUP ###
# DEPRECATED (New functionality listed in comments)
ANALYZE_MODE 0                 # 0 = Disabled
                               # 1 = Enabled
                               # 2 = Interactive
                               # DEPRECATED: use command line options -a[nalyze] or -i[nteractive])
REPRO_METHOD 1                 # Replace existing organism: 1=yes
                               # DEPRECATED: Use BIRTH_METHOD 3 instead.
LEGACY_GRID_LOCAL_SELECTION 0  # Enable legacy grid local mate selection.
                               # DEPRECATED: Birth chameber now uses population structure)
HARDWARE_TYPE 0                # 0 = Default, heads-based CPUs
                               # 1 = New SMT CPUs
                               # 2 = Transitional SMT
                               # 3 = Experimental CPU
                               # 4 = Gene Expression CPU
#INST_SET -                     # Instruction set file ('-' = use default for hardware type)
INST_SET_LOAD_LEGACY 0         # Load legacy format instruction set file format
START_ORGANISM -               # Organism to seed the population

### DEVEL_GROUP ###
# IN DEVELOPMENT (May not function correctly)
WORLD_Z 1  # Depth of the Avida world