{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmath,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_euroc_dataset";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."mola_input_euroc_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-kernel mrpt-libmath mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmath mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_euroc_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_euroc_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "6c562d0eb1337f783710b4c645ab160b72af0fee";
        hash = "sha256-T611On38xn+nkFGEm6CTp0Q96xbvFNrEghOMzaHoPIU=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from EUROC SLAM datasets";
  };
})
