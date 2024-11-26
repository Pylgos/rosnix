{
  ament-cmake-google-benchmark,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rcutils,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  urdf-parser-plugin,
  urdfdom,
  urdfdom-headers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."urdf";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib rcutils tinyxml2-vendor urdf-parser-plugin urdfdom urdfdom-headers ];
  checkInputs = [ ament-cmake-google-benchmark ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "urdf" = substituteSource {
        src = fetchgit {
          name = "urdf-source";
          url = "https://github.com/ros2-gbp/urdf-release.git";
          rev = "36871dcd5a47d953a281ba3d54d41a8d102e1acc";
          hash = "sha256-SvhhpjvdwMyjmAhJdP3SrN72LZ37MKzWvRbd90D4qBI=";
        };
      };
    });
  };
  meta = {
    description = "This package contains a C++ parser for the Unified Robot Description Format (URDF), which is an XML format for representing a robot model. The code API of the parser has been through our review process and will remain backwards compatible in future releases.";
  };
})
