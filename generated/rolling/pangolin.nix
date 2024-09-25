{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    pangolin = substituteSource {
      src = fetchgit {
        name = "pangolin-source";
        url = "https://github.com/ros2-gbp/Pangolin-release.git";
        rev = "04bcab4ca44adc9f6c3bf5e503d3bf84381e771a";
        hash = "sha256-VAE6VKDuVagjFsw1q6X/hpGUYbDSIx+Os9F+/76bo08=";
      };
      substitutions = [
        {
          path = "scripts/vcpkg/ports/qca/portfile.cmake";
          from = "DOWNLOAD https://raw.githubusercontent.com/mozilla/gecko-dev/master/security/nss/lib/ckfw/builtins/certdata.txt";
          to = "DOWNLOAD file://${pangolin-vendor_source-certdata-0}";
        }
      ];
    };
    pangolin-vendor_source-certdata-0 = substituteSource {
      src = fetchurl {
        name = "pangolin-vendor_source-certdata-0-source";
        url = "https://raw.githubusercontent.com/mozilla/gecko-dev/af3eccb4999427e42fdcea558297f1cec70dc4db/security/nss/lib/ckfw/builtins/certdata.txt";
        hash = "sha256-NhBbAWMfn8A7Hsp3m0SjChpYkLm/jcB8ywAaBzAeAc8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pangolin";
  version = "0.9.1-2";
  src = sources.pangolin;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libglew-dev" "libpng-dev" "libturbojpeg" "libxkbcommon-dev" "wayland" "wayland-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Pangolin is a set of lightweight and portable utility libraries for prototyping 3D, numeric or video based programs and algorithms.";
  };
}
