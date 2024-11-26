{
  buildCmakePackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  hpp-fcl,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "pinocchio";
  version = "2.6.21-3";
  src = finalAttrs.passthru.sources."pinocchio";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" "python3-numpy" ]; };
  propagatedBuildInputs = [ eigenpy hpp-fcl ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "liburdfdom-dev" "python3" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "pinocchio" = substituteSource {
        src = fetchgit {
          name = "pinocchio-source";
          url = "https://github.com/ros2-gbp/pinocchio-release.git";
          rev = "4ece81b852e001508a82e42194a34de911b1db5b";
          hash = "sha256-YFDwdoORgCb/x5PR//6nJtG6NghoeKsE60VEwuNP/ik=";
        };
      };
    });
  };
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
})
