{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rcdiscover" = substituteSource {
      src = fetchgit {
        name = "rcdiscover-source";
        url = "https://github.com/ros2-gbp/rcdiscover-release.git";
        rev = "b4819be9a016b59e1db3d1fc1b74627285674c08";
        hash = "sha256-Xw4108ob5fIs8/BbNRMVm3xOzC6l8ZHRs7e3XZ3834M=";
      };
      substitutions = [
      ];
    };
  });
in
buildCmakePackage (finalAttrs: {
  pname = "rcdiscover";
  version = "1.1.7-1";
  src = finalAttrs.passthru.sources."rcdiscover";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "This package contains tools for the discovery of Roboception devices via GigE Vision.";
  };
})
