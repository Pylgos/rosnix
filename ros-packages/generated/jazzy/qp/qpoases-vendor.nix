{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "qpoases_vendor" = substituteSource {
      src = fetchgit {
        name = "qpoases_vendor-source";
        url = "https://github.com/ros2-gbp/qpoases_vendor-release.git";
        rev = "b00c8ebcfedecf8b34d02b6e9ce45d641efc43e8";
        hash = "sha256-jUSNiB8b0P8JHYXdXeKMs5Ucxjk+fhbPqxcJnD2GIQ4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "qpoases_vendor";
  version = "3.2.3-5";
  src = finalAttrs.passthru.sources."qpoases_vendor";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "subversion" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Wrapper around qpOASES to make it available to the ROS ecosystem.";
  };
})
