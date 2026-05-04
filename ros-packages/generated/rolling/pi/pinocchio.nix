{
  buildCmakePackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  jrl-cmakemodules,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  urdfdom,
}:
buildCmakePackage (finalAttrs: {
  pname = "pinocchio";
  version = "3.9.0-2";
  src = finalAttrs.passthru.sources."pinocchio";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = [ eigenpy jrl-cmakemodules ros-environment urdfdom ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "eigen" "git" "hpp-fcl" "python3" "python3-numpy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang" "cmake" ]; };
  propagatedBuildInputs = [ eigenpy jrl-cmakemodules ros-environment urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "eigen" "git" "hpp-fcl" "python3" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pinocchio" = substituteSource {
      src = fetchgit {
        name = "pinocchio-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "5dec4e2f5ca2015213005b8b51d505607b8744cb";
        hash = "sha256-/Oo9BpET8wj1jdjrnBdKiAw5bQ04eaj8b96ip5/QapY=";
      };
    };
  });
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
})
