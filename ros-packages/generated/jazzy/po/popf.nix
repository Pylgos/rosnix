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
  version = "0.1.0-1";
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
        rev = "c6a15217664450aa77b9f2eb5f4d528fd35449d1";
        hash = "sha256-9bYyXy8vcBmjTEFOmCtM1UY4Uo7HAC65XHW5lgBdwVw=";
      };
    };
  });
  meta = {
    description = "The POPF package";
  };
})
