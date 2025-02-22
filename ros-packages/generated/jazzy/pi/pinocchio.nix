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
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."pinocchio";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" "python3-numpy" ]; };
  propagatedBuildInputs = [ eigenpy hpp-fcl urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "python3" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pinocchio" = substituteSource {
      src = fetchgit {
        name = "pinocchio-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "ede4ec3f6c95edfbbd6b7067860afcbe44460482";
        hash = "sha256-tQH+eP3CoBlsAwZJ5oe6kI88mJWw0nVbQfqHUWUnWyk=";
      };
    };
  });
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
})
