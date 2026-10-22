function varargout = tcp_sim_server(action, varargin)
persistent server

if isempty(server)
    server = tcpserver('0.0.0.0', 4560);
end

switch action
    case "read"
        data = zeros(1,126,'uint8');
        status = server.Connected;
        n_bytes = 0;

        if (status && server.NumBytesAvailable > 0) 
            n_bytes = min(server.NumBytesAvailable,126);
            temp = read(server,n_bytes,"uint8");
            data(1:n_bytes) = temp;
        end

        varargout{1} = status;
        varargout{2} = data;
        varargout{3} = n_bytes;
    case "write"
        status = server.Connected;
        if (status)
            data = varargin{1};
            server.write(data, "uint8");
        end
    case "close"
        disp('closing sim tcp server');
        server.delete
        clear server;
end
end