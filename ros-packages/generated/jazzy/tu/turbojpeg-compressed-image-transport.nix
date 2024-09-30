{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "turbojpeg_compressed_image_transport" = substituteSource {
      src = fetchgit {
        name = "turbojpeg_compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/turbojpeg_compressed_image_transport-release.git";
        rev = "b06c8c2136a8797b7d8136c1e2eada128cb6dc1d";
        hash = "sha256-290O2WlZeS1IA0hOWZ0GYuYv0yt8SkAIxoz+P3YiVi8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "turbojpeg_compressed_image_transport";
  version = "0.2.1-5";
  src = sources."turbojpeg_compressed_image_transport";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge image-transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libturbojpeg" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Compressed_image_transport provides a plugin to image_transport for transparently sending images encoded as JPEG by turbojpeg.";
  };
}
