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
let
  sources = mkSourceSet (sources: {
    "popf" = substituteSource {
      src = fetchgit {
        name = "popf-source";
        url = "https://github.com/ros2-gbp/popf-release.git";
        rev = "bb811a0ad2d771cc49a83ab9e42b7fb663637791";
        hash = "sha256-TJKpSf62pP7klj4DN47+5tHR0WznsqxheV/XJBb0QIQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "popf";
  version = "0.0.17-1";
  src = finalAttrs.passthru.sources."popf";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bison" "coinor-libcbc-dev" "coinor-libcgl-dev" "coinor-libclp-dev" "coinor-libcoinutils-dev" "flex" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The POPF package";
  };
})