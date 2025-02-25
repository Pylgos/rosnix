{
  buildCmakePackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  hpp-fcl,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  urdfdom,
}:
buildCmakePackage (finalAttrs: {
  pname = "pinocchio";
  version = "3.4.0-3";
  src = finalAttrs.passthru.sources."pinocchio";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" ]; };
  propagatedBuildInputs = [ eigenpy hpp-fcl urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "python3" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pinocchio" = substituteSource {
      src = fetchgit {
        name = "pinocchio-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "5782f0cf8b845f4b5df225d0ab4b73564a5591dc";
        hash = "sha256-HyLjifuhkperqjWOklOYL+KWWXQEM/RavkFvw8wCj/Q=";
      };
    };
  });
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
})
