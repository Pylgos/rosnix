{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "popf";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."popf";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "bison" "coinor-libcbc-dev" "coinor-libcgl-dev" "coinor-libclp-dev" "coinor-libcoinutils-dev" "flex" "libfl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bison" "coinor-libcbc-dev" "coinor-libcgl-dev" "coinor-libclp-dev" "coinor-libcoinutils-dev" "flex" "libfl-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "popf" = substituteSource {
      src = fetchgit {
        name = "popf-source";
        url = "https://github.com/ros2-gbp/popf-release.git";
        rev = "b7ee40107700475aaea767787f77289c648dd5de";
        hash = "sha256-X1C3VSeOpZc11PYWkRqg0ro4tuqI3QJQRfvAgbuZYkg=";
      };
    };
  });
  meta = {
    description = "The POPF package";
  };
})
