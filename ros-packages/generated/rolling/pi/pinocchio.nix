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
  version = "3.6.0-1";
  src = finalAttrs.passthru.sources."pinocchio";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = [ eigenpy hpp-fcl ros-environment urdfdom ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "eigen" "git" "python3" "python3-numpy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang" "cmake" ]; };
  propagatedBuildInputs = [ eigenpy hpp-fcl ros-environment urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "eigen" "git" "python3" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pinocchio" = substituteSource {
      src = fetchgit {
        name = "pinocchio-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "ff0d7a7d0d94d5cbca6431e358cf0b0a537b2b55";
        hash = "sha256-ni7OzA+hDoWX/Cs2Qdizp2Is8xsiG04J8YOqM3hhNJY=";
      };
    };
  });
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
})
