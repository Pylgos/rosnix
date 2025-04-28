{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_rawlog";
  version = "1.6.4-1";
  src = finalAttrs.passthru.sources."mola_input_rawlog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_rawlog" = substituteSource {
      src = fetchgit {
        name = "mola_input_rawlog-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "598bf2f96deb4dd8e8d803a9288ed1da3dd8c864";
        hash = "sha256-B6xwImWzAGBElXeN7q8585DzUMrXsxyDlBeiHPqzmOE=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
})
