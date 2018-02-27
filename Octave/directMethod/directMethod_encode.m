function encData = directMethod_encode(data, absTol, relTol, fixPoint)
    encData = round( directMethod_transformForward(data, absTol, relTol, fixPoint) );
