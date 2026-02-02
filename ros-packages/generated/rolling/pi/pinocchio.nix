{
  buildCmakePackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  hpp-fcl,
  jrl-cmakemodules,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  urdfdom,
}:
buildCmakePackage (finalAttrs: {
  pname = "pinocchio";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."pinocchio";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = [ eigenpy hpp-fcl jrl-cmakemodules ros-environment urdfdom ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "eigen" "git" "python3" "python3-numpy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang" "cmake" ]; };
  propagatedBuildInputs = [ eigenpy hpp-fcl jrl-cmakemodules ros-environment urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "eigen" "git" "python3" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pinocchio" = substituteSource {
      src = fetchgit {
        name = "pinocchio-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "24d29d0e8f8977925d32758124eea5c5a57835d8";
        hash = "sha256-SiZYpzE1diS9SU4mJUQgkyP9Dmiw2P9Qt4Tlm69VS5Y=";
      };
    };
  });
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
})
