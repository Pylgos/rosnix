{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mavlink,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libmavconn";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."libmavconn";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mavlink ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" "libconsole-bridge-dev" "python3-empy" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mavlink ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "libconsole-bridge-dev" "python3-empy" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "libmavconn" = substituteSource {
      src = fetchgit {
        name = "libmavconn-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "b4cfb64141ac82243108e4202ec042cc49d61797";
        hash = "sha256-o7pkKv1oaI74hq51YSIwsPT27+HInEVPZv2okEeSMhQ=";
      };
    };
  });
  meta = {
    description = "\n    MAVLink communication library.\n    This library provide unified connection handling classes\n    and URL to connection object mapper.\n\n    This library can be used in standalone programs.\n  ";
  };
})
