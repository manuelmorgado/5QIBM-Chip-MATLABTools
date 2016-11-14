% MATLAB routines for quantum computation (Manuel Morgado).
% AND
% MATLAB routines for quantum mechanics (Geza Toth)*.
% 
% General
%  Contenido            - List of commands
%  Version              - Version
%
% Bras and kets
%  *ket                  - Creating a normalized column vector (Dirac's ket)
%  *bra                  - Creating a normalized row vector    (Dirac's bra)
%  *ketbra               - Creating a projector from a vector
%  *braket               - Dirac's braket
%  *exval                - Expectation value
%  *variancia            - Variance
%  *nm                   - Normalization
%
%
% Reordering a qudit register
%  *mkron                - Kronecker product with several arguments
%  *pkron                - Multiplying a matrix with istself given times
%                         using the Kornecker product
%
% Interesting quantum states, quantum gates and operators
%  *ghz                  - Greenberger-Horne-Zeilinger state
%  *U_CNOT               - 4x4 unitary matrix of a CNOT gate
%  *U_H                  - 2x2 unitary matrix for the Hadamard gate
%  
% Formatted input/output
%  *printv               - Print state vector in product basis
%
% Random vectors, matrices and operations
%  *rvec                 - Random state vector for a given number of
%                        qudits
%  *runitary             - Random unitary for a qudit register
%
% Miscellenous simple commands
%  *maxeig               - Maximum eigenvalue of a matrix    
%  *mineig               - Minimum eigenvalue of a matrix 
%  *acnm                 - Anticonmutator
%  *cnm                  - Commutator
%  *thstate              - Thermal ground state
%  *ruidos               - Add white noise to a quantum state
%  *qvec                 - Empty statevector for given number of qudits
%  *qsize                - Size of state vector or density matrix in qudits
%  *qeye                 - Identity matrix for given number of qudits
%
