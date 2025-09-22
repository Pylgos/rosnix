{
  ackermann-msgs,
  ackermann-nlmpc-msgs,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ackermann_nlmpc";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."ackermann_nlmpc";
  propagatedNativeBuildInputs = [ ackermann-msgs ackermann-nlmpc-msgs geometry-msgs nav-msgs std-msgs ];
  propagatedBuildInputs = [ ackermann-msgs ackermann-nlmpc-msgs geometry-msgs nav-msgs std-msgs ];
  checkInputs = [ ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ackermann_nlmpc" = substituteSource {
      src = fetchgit {
        name = "ackermann_nlmpc-source";
        url = "https://github.com/ros2-gbp/ackmerann_nlmpc-release.git";
        rev = "c9484d56b05e2d7d097e81cf3caa08bf36abe162";
        hash = "sha256-I4DSVmie/MKEvsNSOTGxDcVxdiTN2L/uIOkUzxtw/CQ=";
      };
    };
  });
  meta = {
    description = "Lightweight non-linear MPC controller for autonomous driving in 2D environments";
  };
})
