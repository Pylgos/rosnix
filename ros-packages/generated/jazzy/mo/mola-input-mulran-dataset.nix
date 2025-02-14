{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmaps,
  mrpt-libposes,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_mulran_dataset";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."mola_input_mulran_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_mulran_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_mulran_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "b76c669baaf1221d4854b186b6585280f1320d30";
        hash = "sha256-bLBp6AXjOLpIg+3CWDYa9TJHRHWwzW0kXuQjPxyhhm4=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MulRan datasets";
  };
})
