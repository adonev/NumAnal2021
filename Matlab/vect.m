function vect(vectorize)

   N=1000000; % The number of elements

   x=linspace(0,1,N); % Grid of N equi-spaced points

   tic;
   if(vectorize) % Vectorized
      x=sqrt(x);
   else % Non-vectorized
      for i=1:N
         x(i)=sqrt(x(i));
      end
   end
   elapsed=toc;

   fprintf('CPU time for N=%d is %g s\n', N, elapsed);

end
